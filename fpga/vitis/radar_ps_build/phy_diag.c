#include "xparameters.h"
#include "xil_printf.h"
#include "xemacps.h"
#include "platform.h"
#include "xtime_l.h"
int main(void){XEmacPs e;XEmacPs_Config*c;u16 id1,id2,p,tx,rx;XTime_SetTime(0);init_platform();c=XEmacPs_LookupConfig(XPAR_XEMACPS_0_DEVICE_ID);XEmacPs_CfgInitialize(&e,c,c->BaseAddress);XEmacPs_SetMdioDivisor(&e,MDC_DIV_224);XEmacPs_PhyRead(&e,1,2,&id1);XEmacPs_PhyRead(&e,1,3,&id2);XEmacPs_PhyRead(&e,1,0x1f,&p);XEmacPs_PhyWrite(&e,1,0x1f,0x0d08);XEmacPs_PhyRead(&e,1,0x11,&tx);XEmacPs_PhyRead(&e,1,0x15,&rx);XEmacPs_PhyWrite(&e,1,0x1f,p);xil_printf("PHY=%04x:%04x PAGE=%04x TXCR=%04x RXCR=%04x\r\n",id1,id2,p,tx,rx);while(1){}}
