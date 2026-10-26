/*
 * Snippets to merge into the lwIP Echo Server template's lwipopts.h.
 * Do not compile this file by itself.
 */
#if 0
#define LWIP_UDP                    1
#define LWIP_TCP                    1
#define LWIP_DHCP                   0
#define MEM_SIZE                    (32*1024)
#define MEMP_NUM_UDP_PCB            8
#define PBUF_POOL_SIZE              256
#define PBUF_POOL_BUFSIZE           1700
#define LWIP_IPV6                   0
#define CHECKSUM_GEN_UDP            0   /* Zynq GEM can offload; template may already set this */
#define CHECKSUM_CHECK_UDP          0
#endif
