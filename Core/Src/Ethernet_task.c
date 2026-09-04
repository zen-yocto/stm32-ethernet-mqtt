/*
 * Ethernet_task.c
 *
 *  Created on: Aug 26, 2026
 *      Author: Home
 */
#include "cmsis_os.h"
#include "enc28j60.h"
#include "defines.h"
#include <string.h>
#include "lwip/etharp.h"      // for etharp_output()
#include "lwip/init.h"        // for lwip_init()
#include "lwip/ip_addr.h"     // for IP4_ADDR() macros
#include "lwip/netif.h"       // for struct netif, netif_add()
#include "lwip/tcpip.h"       // for tcpip_init(), tcpip_input()
#include "tcp_test.h"
#include "rtos_resources.h"
SemaphoreHandle_t txSemaphore;


ENC28J60_Frame recieveFrame;
void ENC28J60_TestSend(void);
void sendARPReply(uint8_t *rxFrame);
void processFrame(uint16_t len);
struct pbuf *low_level_input(struct netif *netif);
err_t low_level_output(struct netif *netif, struct pbuf *p);
TaskHandle_t EthernetTaskHandle;
uint8_t header[6];

uint8_t irq_rec=0;
uint8_t pktCNT=0;
struct netif gnetif;
extern uint8_t myMAC[MAC_ADDRESS_BYTES_NUM];
void Ethernet_Task(void *argument)
{
	ip4_addr_t ipaddr, netmask, gw;
	IP4_ADDR(&ipaddr, 192,168,1,57);
	IP4_ADDR(&netmask, 255,255,255,0);
	IP4_ADDR(&gw, 192,168,1,1);

	tcpip_init(NULL, NULL);


	txSemaphore = xSemaphoreCreateBinary();
	 xSemaphoreGive(txSemaphore);
	netif_add(&gnetif, &ipaddr, &netmask, &gw, NULL,
	          &ENC28J60_Init, &tcpip_input);
	 gnetif.hwaddr_len = 6;
		    memcpy(gnetif.hwaddr, myMAC, 6);

		    gnetif.mtu = 1500;
		    gnetif.flags = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_LINK_UP;

		    gnetif.output     = etharp_output;
		    gnetif.linkoutput = low_level_output;

		    gnetif.name[0] = 'e';
		    gnetif.name[1] = 'n';


	netif_set_default(&gnetif);
	netif_set_up(&gnetif);
	 netif_set_link_up(&gnetif);
	//netif_set_link_callback(&gnetif, link_callback);
	//netif_set_status_callback(&gnetif, status_callback);

	//ENC28J60_Init();
	//WriteControlReg(EIE, EIR_PKTIF_BIT | EIR_RXERIF_BIT | EIR_TXIF_BIT);
	 /* USER CODE BEGIN 5 */
	    /* Infinite loop */
	    //Let ENC28J60 startup
	uint8_t rev=0;
	rev = ReadControlReg(EREVID);
	uint16_t phstat2=0;
	phstat2 = ReadPhyReg(PHSTAT2);
	//uint16_t phstat2 = ReadPhyReg(PHSTAT2);
	// ENC28J60_TestSend();
	// Set TXIE bit in EIE

	WriteControlReg(EIE, EIE_INTIE | EIE_PKTIE | EIE_TXIE| EIE_TXERIE|EIE_RXERIE);

   // sendGratuitousARP();
	for(;;){


		    // Read the 6‑byte RX header
		   // ReadBufferMem(header, 6);

		    // Extract packet length (bytes 2–3 of header)
		  //  len = header[2] | (header[3] << 8);
		  //  ENC28J60_TestSend();
		    // Now process the frame
	if (irq_rec){

	 while (ReadControlReg(EPKTCNT)){
//		enc28j60_readFrame(&recieveFrame);
//		BitFieldSet(ECON2, ECON2_PKTDEC_BIT);
//
//		sendreply(&recieveFrame);
			struct pbuf *p = low_level_input(&gnetif);
			if (p != NULL) {
				if (gnetif.input(p, &gnetif) != ERR_OK) {
					pbuf_free(p);
				}
			}
			BitFieldSet(ECON2, ECON2_PKTDEC_BIT);
	}irq_rec=0;


		}


//		ENC28J60_TestSend();
	    uint8_t eir     = ReadControlReg(EIR);
	    if(eir) ethernet_irq_handler();
	    uint8_t eie     = ReadControlReg(EIE);
	    uint8_t estat   = ReadControlReg(ESTAT);
	    uint8_t econ1   = ReadControlReg(ECON1);
	    uint8_t econ2   = ReadControlReg(ECON2);
	    uint8_t pktcnt  = ReadControlReg(EPKTCNT);
	    uint8_t macon3 = ReadControlReg(MACON3);
	    uint16_t phstat1 = ReadPhyReg(PHSTAT1);
	    uint16_t phstat2 = ReadPhyReg(PHSTAT2);
	    uint16_t phir    = ReadPhyReg(PHIR);
	    uint16_t phie    = ReadPhyReg(PHIE);


	       if (estat & 0x40) { // BUFER bit set
	           // 1. Disable receiver
	           BitFieldClear(ECON1, ECON1_RXEN_BIT);
	           // 2. Flush all pending packets
	           WriteControlRegPair(ERXRDPTL, ENC28J60_RX_BUF_START);
	           while (ReadControlReg(EPKTCNT) > 0) {
	               BitFieldSet(ECON2, ECON2_PKTDEC_BIT);
	           }
	               // Clear BUFER bit
	               BitFieldClear(ESTAT, 0x40);
	           // 3. Re-enable receiver
	           BitFieldSet(ECON1, ECON1_RXEN_BIT);
	       }
	       if(phir)
	       WritePhyReg(PHIR, 0x10);
	       BitFieldSet(EIE, 0x80);
	       tcp_client_init();
	osDelay(500);
	}

}
void CreateEthernetTask(void)
	{
	  xTaskCreate(
		  Ethernet_Task,          // task function
		  "Ethernet TCP Task",         // name
		  ethernet_Stack_Size,                 // stack
		  NULL,                // argument
		  ETHERNET_TASK_PRIORITY,  // priority
		  &EthernetTaskHandle     // handle
	  );
	}
void ENC28J60_TestSend(void)
{
    uint8_t testFrame[64]; // minimum Ethernet frame size
    for (int i = 0; i < sizeof(testFrame); i++) {
        testFrame[i] = i; // fill with pattern data
    }

    // Set write pointer to TX buffer start
    WriteControlRegPair(EWRPTL, ENC28J60_TX_BUF_START);

    // Set TXND pointer = start + frame length
    WriteControlRegPair(ETXNDL, ENC28J60_TX_BUF_START + sizeof(testFrame));

    // Write frame into buffer
    WriteBufferMem(testFrame, sizeof(testFrame));

    // Clear TXIF flag
    BitFieldClear(EIR, EIR_TXIF_BIT);

    // Start transmission
    BitFieldSet(ECON1, ECON1_TXRTS_BIT);

    // Wait until TXRTS clears
    while (ReadControlReg(ECON1) & ECON1_TXRTS_BIT);

    // Check TX status
    if (ReadControlReg(EIR) & EIR_TXIF_BIT) {
        printf("Test frame sent successfully!\r\n");
    } else {
        printf("Transmit failed.\r\n");
    }
}





err_t low_level_output(struct netif *netif, struct pbuf *p) {
    struct pbuf *q;
    uint16_t tx_len = 0;
    uint8_t ctrl = PKTCTRL_DEFAULT;
    if (xSemaphoreTake(txSemaphore, pdMS_TO_TICKS(100)) == pdTRUE) {

    // --- Set TX write pointer ---
    WriteControlRegPair(EWRPTL, ENC28J60_TX_BUF_START);
	WriteBufferMem(&ctrl, 1);

    // --- Copy pbuf chain into ENC28J60 TX buffer ---
    for (q = p; q != NULL; q = q->next) {
        WriteBufferMem((uint8_t*)q->payload, q->len);
        tx_len += q->len;
    }

    // --- Set TX end pointer ---
    WriteControlRegPair(ETXNDL, ENC28J60_TX_BUF_START + tx_len);

    // --- Trigger TX ---
    BitFieldSet(ECON1, ECON1_TXRTS_BIT);

    return ERR_OK;
        } else {
            return ERR_TIMEOUT;
        }


}

struct pbuf *low_level_input(struct netif *netif) {
    // Read frame into recieveFrame (your function should also fill nextPtr)
	uint8_t hdr[8];
	//enc28j60_readFrame(&recieveFrame);
	ENC28J60_Frame frame;
    ReadBufferMem(hdr, 6);
           frame.nextPtr = hdr[0] | (hdr[1] << 8);
           frame.length  = hdr[2] | (hdr[3] << 8);
           frame.status  = hdr[4] | (hdr[5] << 8);// | (hdr[6] << 16) | (hdr[7] << 24);
           if(frame.length ==0) return NULL;

    // Allocate pbuf chain
		struct pbuf *p = pbuf_alloc(PBUF_RAW, frame.length-4, PBUF_POOL);
		if (p == NULL) {
		// Drop packet if no memory
		WriteControlRegPair(ERXRDPTL, frame.nextPtr);
		return NULL;
		}

    // Copy frame data into pbuf chain
    struct pbuf *q;
    if(frame.length<= ENC28J60_MAX_FRAME){
    for (q = p; q != NULL; q = q->next) {
    	ReadBufferMem(q->payload,q->len );
        //memcpy(q->payload, &recieveFrame.data, q->len);

    }

      uint8_t dummy[4];
          ReadBufferMem(dummy, 4);
    // Release RX packet (advance RX read pointer)
          if(frame.nextPtr>ENC28J60_RX_BUF_END)
        	  frame.nextPtr=ENC28J60_RX_BUF_START;
    WriteControlRegPair(ERXRDPTL, frame.nextPtr);
    }
    return p;

}



