#include "radar_app.h"
#include "radar_config.h"
#include "xaxidma.h"
#include "xil_cache.h"
#include "xil_printf.h"

static XAxiDma s_dma;
static int     s_dma_ok = 0;

int radar_dma_init(void)
{
    XAxiDma_Config *cfg = XAxiDma_LookupConfig(DMA_DEV_ID);
    int st;

    if (!cfg) {
        xil_printf("ERROR: AXI DMA config not found (id=%d)\r\n", DMA_DEV_ID);
        return -1;
    }
    st = XAxiDma_CfgInitialize(&s_dma, cfg);
    if (st != XST_SUCCESS) {
        xil_printf("ERROR: AXI DMA init failed (%d)\r\n", st);
        return -1;
    }
    if (XAxiDma_HasSg(&s_dma)) {
        xil_printf("ERROR: DMA is SG; this app uses simple mode\r\n");
        return -1;
    }
    XAxiDma_IntrDisable(&s_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&s_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    s_dma_ok = 1;
    xil_printf("AXI DMA ready (simple MM2S)\r\n");
    return 0;
}

int radar_dma_kick(uint32_t *buf, uint32_t nbytes)
{
    int st;
    if (!s_dma_ok)
        return -1;

    Xil_DCacheFlushRange((UINTPTR)buf, nbytes);
    st = XAxiDma_SimpleTransfer(&s_dma, (UINTPTR)buf, nbytes,
                                XAXIDMA_DMA_TO_DEVICE);
    if (st != XST_SUCCESS)
        return -1;
    return 0;
}

int radar_dma_wait_idle(uint32_t timeout_loops)
{
    uint32_t i;
    for (i = 0; i < timeout_loops; i++) {
        if (!XAxiDma_Busy(&s_dma, XAXIDMA_DMA_TO_DEVICE))
            return 0;
    }
    return -1;
}
