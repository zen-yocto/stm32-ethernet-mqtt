/**
  ******************************************************************************
  * @file           : enc28j60.c
  * @brief          : ENC28J60 driver
  * @author         : MicroTechnics (microtechnics.ru)
  ******************************************************************************
  */



/* Includes ------------------------------------------------------------------*/

#include "enc28j60.h"
#include "rtos_resources.h"



/* Declarations and definitions ----------------------------------------------*/
uint8_t myIP[4] = {192, 168, 1, 67};
uint8_t myMAC[MAC_ADDRESS_BYTES_NUM] = {0x00, 0x17, 0x22, 0xED, 0xA5, 0x01};
//uint8_t myMAC[6] = {0x02, 0x04, 0xA3, 0x12, 0x34, 0x56};
uint8_t txBuf[ENC28J60_MAX_FRAME];
uint8_t localBuf[ENC28J60_MAX_FRAME] = {0};

uint8_t commandOpCodes[COMMANDS_NUM] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07};
 ENC28J60_RegBank curBank = BANK_0;

extern SPI_HandleTypeDef hspi2;



/* Functions -----------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
void SetCS(ENC28J60_CS_State state)
{
  HAL_GPIO_WritePin(ENC28J60_CS_PORT, ENC28J60_CS_PIN, (GPIO_PinState)state);
}



/*----------------------------------------------------------------------------*/
 void WriteBytes(uint8_t* data, uint8_t size)
{
  HAL_StatusTypeDef res = HAL_SPI_Transmit(&hspi2, data, size, ENC28J60_SPI_TIMEOUT);
}



/*----------------------------------------------------------------------------*/
void WriteByte(uint8_t data)
{
  HAL_StatusTypeDef res = HAL_SPI_Transmit(&hspi2, &data, 1, ENC28J60_SPI_TIMEOUT);
}



/*----------------------------------------------------------------------------*/
 uint8_t ReadByte()
{
  uint8_t txData = 0x00;
  uint8_t rxData = 0x00;
  HAL_StatusTypeDef res = HAL_SPI_TransmitReceive(&hspi2, &txData, &rxData, 1, ENC28J60_SPI_TIMEOUT);
  return rxData;
}



/*----------------------------------------------------------------------------*/
ENC28J60_RegType getRegType(uint8_t reg)
{
  ENC28J60_RegType type = (ENC28J60_RegType)((reg & ENC28J60_REG_TYPE_MASK) >> ENC28J60_REG_TYPE_OFFSET);
  return type;
}



/*----------------------------------------------------------------------------*/
 ENC28J60_RegBank getRegBank(uint8_t reg)
{
  ENC28J60_RegBank bank = (ENC28J60_RegBank)((reg & ENC28J60_REG_BANK_MASK) >> ENC28J60_REG_BANK_OFFSET);
  return bank;
}



/*----------------------------------------------------------------------------*/
 uint8_t getRegAddr(uint8_t reg)
{
  uint8_t addr = (reg & ENC28J60_REG_ADDR_MASK);
  return addr;
}



/*----------------------------------------------------------------------------*/
 void WriteCommand(ENC28J60_Command command, uint8_t argData)
{
  uint8_t data = 0;
  data = (commandOpCodes[command] << ENC28J60_OP_CODE_OFFSET) | argData;
  WriteByte(data);
}



/*----------------------------------------------------------------------------*/
void CheckBank(uint8_t reg)
{
  uint8_t regAddr = getRegAddr(reg);  
  if (regAddr < ENC28J60_COMMON_REGS_ADDR)
  {
    ENC28J60_RegBank regBank = getRegBank(reg);    
    if (curBank != regBank)
    {
      uint8_t econ1Addr = getRegAddr(ECON1);
      
      // Clear bank bits
      SetCS(CS_LOW); 
      WriteCommand(BIT_FIELD_CLEAR, econ1Addr);
      WriteByte(ECON1_BSEL1_BIT | ECON1_BSEL0_BIT);
      SetCS(CS_HIGH);
      
      // Set bank bits
      SetCS(CS_LOW); 
      WriteCommand(BIT_FIELD_SET, econ1Addr);
      WriteByte(regBank);
      SetCS(CS_HIGH);
      
      curBank = regBank;
    }
  }
}



/*----------------------------------------------------------------------------*/
 void BitFieldSet(uint8_t reg, uint8_t regData)
{
  uint8_t regAddr = getRegAddr(reg);
  CheckBank(reg);
  
  SetCS(CS_LOW); 
  WriteCommand(BIT_FIELD_SET, regAddr);
  WriteByte(regData);
  SetCS(CS_HIGH);
}



/*----------------------------------------------------------------------------*/
void BitFieldClear(uint8_t reg, uint8_t regData)
{
  uint8_t regAddr = getRegAddr(reg);
  CheckBank(reg);
  
  SetCS(CS_LOW); 
  WriteCommand(BIT_FIELD_CLEAR, regAddr);
  WriteByte(regData);
  SetCS(CS_HIGH);
}



/*----------------------------------------------------------------------------*/
uint8_t ReadControlReg(uint8_t reg)
{
  uint8_t data = 0;
  ENC28J60_RegType regType = getRegType(reg);
  uint8_t regAddr = getRegAddr(reg);
  CheckBank(reg);
  
  SetCS(CS_LOW);
  WriteCommand(READ_CONTROL_REG, regAddr);

  if (regType == MAC_MII_REG)
  {
    ReadByte();
  }
  data = ReadByte();
  
  SetCS(CS_HIGH);
  return data;
}



/*----------------------------------------------------------------------------*/
void WriteControlReg(uint8_t reg, uint8_t regData)
{
  uint8_t regAddr = getRegAddr(reg);
  CheckBank(reg);
  
  SetCS(CS_LOW); 
  WriteCommand(WRITE_CONTROL_REG, regAddr);
  WriteByte(regData);
  SetCS(CS_HIGH);
}



/*----------------------------------------------------------------------------*/
 void WriteControlRegPair(uint8_t reg, uint16_t regData)
{
  WriteControlReg(reg, (uint8_t)regData);
  WriteControlReg(reg + 1, (uint8_t)(regData >> 8));
}



/*----------------------------------------------------------------------------*/
 uint16_t ReadControlRegPair(uint8_t reg)
{
  uint16_t data = 0;
  data = (uint16_t)ReadControlReg(reg) | ((uint16_t)ReadControlReg(reg + 1) << 8);
  return data;
}



/*----------------------------------------------------------------------------*/
 void WriteBufferMem(uint8_t *data, uint16_t size)
{

  SetCS(CS_LOW); 

  WriteCommand(WRITE_BUFFER_MEM, ENC28J60_BUF_COMMAND_ARG);
  //WriteByte(0x00);
  WriteBytes(data, size);
  SetCS(CS_HIGH);
}



/*----------------------------------------------------------------------------*/
 void ReadBufferMem(uint8_t *data, uint16_t size)
{
  SetCS(CS_LOW); 
  WriteCommand(READ_BUFFER_MEM, ENC28J60_BUF_COMMAND_ARG);
  
  for (uint16_t i = 0; i < size; i++)
  {
    *data = ReadByte();
    data++;
  }
  
  SetCS(CS_HIGH);
}



/*----------------------------------------------------------------------------*/
 void SystemReset()
{
  SetCS(CS_LOW);
  WriteCommand(SYSTEM_RESET, ENC28J60_RESET_COMMAND_ARG);
  SetCS(CS_HIGH);
  
  curBank = BANK_0;
  HAL_Delay(100);
}



/*----------------------------------------------------------------------------*/
 uint16_t ReadPhyReg(uint8_t reg)
{
  uint16_t data = 0;
  uint8_t regAddr = getRegAddr(reg);
  
  WriteControlReg(MIREGADR, regAddr);
  BitFieldSet(MICMD, MICMD_MIIRD_BIT);
  
  while((ReadControlReg(MISTAT) & MISTAT_BUSY_BIT) != 0);
  
  BitFieldClear(MICMD, MICMD_MIIRD_BIT);
  data = ReadControlRegPair(MIRDL);
  
  return data;
}



/*----------------------------------------------------------------------------*/
 void WritePhyReg(uint8_t reg, uint16_t regData)
{
  uint8_t regAddr = getRegAddr(reg);
  
  WriteControlReg(MIREGADR, regAddr);
  WriteControlRegPair(MIWRL, regData);
  
  while((ReadControlReg(MISTAT) & MISTAT_BUSY_BIT) != 0);
}




/*----------------------------------------------------------------------------*/
err_t ENC28J60_Init()
{
  HAL_GPIO_WritePin(ENC28J60_RESET_PORT, ENC28J60_RESET_PIN, GPIO_PIN_RESET);
  HAL_Delay(50);
  HAL_GPIO_WritePin(ENC28J60_RESET_PORT, ENC28J60_RESET_PIN, GPIO_PIN_SET);
  HAL_Delay(50);
  
  SystemReset();

  while (!(ReadControlReg(ESTAT) & 0x01)) {
      ; // wait for CLKRDY
  }
  // Rx/Tx buffers
  WriteControlRegPair(ERXSTL, ENC28J60_RX_BUF_START);
  WriteControlRegPair(ERXRDPTL,ENC28J60_RX_BUF_END );
  WriteControlRegPair(ERXNDL, ENC28J60_RX_BUF_END);

  WriteControlRegPair(ERDPTL, ENC28J60_RX_BUF_START);

  // MAC address
  WriteControlReg(MAADR1, myMAC[0]);
  WriteControlReg(MAADR2, myMAC[1]);
  WriteControlReg(MAADR3, myMAC[2]);
  WriteControlReg(MAADR4, myMAC[3]);
  WriteControlReg(MAADR5, myMAC[4]);
  WriteControlReg(MAADR6, myMAC[5]);
  
  WriteControlReg(MACON1, MACON1_TXPAUS_BIT | MACON1_RXPAUS_BIT | MACON1_MARXEN_BIT);
  WriteControlReg(MACON3, MACON3_PADCFG0_BIT | MACON3_TXCRCEN_BIT | MACON3_FRMLNEN_BIT| MACON3_FULDPX_BIT);
  WriteControlReg(ERXFCON, ERXFCON_UCEN_BIT|ERXFCON_BCEN_BIT|ERXFCON_CRCEN_BIT);

  WriteControlRegPair(MAIPGL, ENC28J60_NBB_PACKET_GAP);
  WriteControlReg(MABBIPG, ENC28J60_BB_PACKET_GAP);

  WriteControlRegPair(MAMXFLL, ENC28J60_FRAME_DATA_MAX);


  // PHY resisters
  WritePhyReg(PHCON2, PHCON2_HDLDIS_BIT);
  WritePhyReg(PHCON1, 0x0100);
  ENC28J60_StartReceiving();
return ERR_OK;
}



/*----------------------------------------------------------------------------*/
void ENC28J60_StartReceiving()
{
  BitFieldSet(ECON1, ECON1_RXEN_BIT);
}

extern uint8_t irq_rec;

/*----------------------------------------------------------------------------*/
void ethernet_irq_handler(void) {


    // Read EIR register
    uint8_t eir = ReadControlReg(EIR);

    // --- TX complete ---
    if (eir & EIR_TXIF_BIT) {
    	BaseType_t xHigherPriorityTaskWoken = pdFALSE;


    	        // Clear TX flag
    	        BitFieldClear(EIR, EIR_TXIF_BIT);

    	        // Release semaphore
    	        xSemaphoreGiveFromISR(txSemaphore, &xHigherPriorityTaskWoken);
    	        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);


       // onEncTxComplete();   // user-defined handler
    }

    // --- TX error ---
    if (eir & EIR_TXERIF_BIT) {
        BitFieldClear(EIR, EIR_TXERIF_BIT);
       // onEncTxError();      // user-defined handler
    }

    // --- RX error ---
    if (eir & EIR_RXERIF_BIT) {
    	BitFieldClear(ECON1, ECON1_RXEN_BIT);
    	while (ReadControlReg(EPKTCNT) > 0) {
    	    BitFieldSet(ECON2, ECON2_PKTDEC_BIT);
    	}
    	WriteControlRegPair(ERXRDPTL,ENC28J60_RX_BUF_START );
        BitFieldClear(EIR, EIR_RXERIF_BIT);
        BitFieldSet(ECON1, ECON1_RXEN_BIT);
       // onEncRxError();      // user-defined handler
    }

    // --- Packet received ---
    if (eir & EIR_PKTIF_BIT) {
        BitFieldClear(EIR, EIR_PKTIF_BIT);
        irq_rec=1;
       // onEncPacketReceived(); // user-defined handler
    }

    // --- DMA interrupt ---
    if (eir & EIR_DMAIF_BIT) {
        BitFieldClear(EIR, EIR_DMAIF_BIT);
       // onEncDmaEvent();     // optional handler
    }

    // --- Link status change ---
    if (eir & EIR_LINKIF_BIT) {
        BitFieldClear(EIR, EIR_LINKIF_BIT);
        //onEncLinkChange();   // optional handler
    }

}
uint8_t is_mqtt =0;
void enc28j60_parseFrame(ENC28J60_Frame *f, const uint8_t *buf, uint16_t len)
{
    const uint8_t *ptr = buf;

    // --- ENC28J60 RX header ---

    // --- Ethernet header ---
    memcpy(f->destMAC, ptr, 6); ptr += 6;
    memcpy(f->srcMAC,  ptr, 6); ptr += 6;
    f->etherType = (ptr[0] << 8) | ptr[1]; ptr += 2;

    // --- ARP ---
    if (f->etherType == 0x0806 && len >= 42) {
        f->arp.hwType    = (ptr[0] << 8) | ptr[1];
        f->arp.protoType = (ptr[2] << 8) | ptr[3];
        f->arp.hwSize    = ptr[4];
        f->arp.protoSize = ptr[5];
        f->arp.opcode    = (ptr[6] << 8) | ptr[7];
        memcpy(f->arp.senderMAC, ptr+8, 6);
        memcpy(f->arp.senderIP,  ptr+14, 4);
        memcpy(f->arp.targetMAC, ptr+18, 6);
        memcpy(f->arp.targetIP,  ptr+24, 4);
        ptr += 28;
    }

    // --- IPv4 ---
    else if (f->etherType == 0x0800 && len >= 34) {
        f->ip.version_ihl    = ptr[0];
        f->ip.tos            = ptr[1];
        f->ip.totalLength    = (ptr[2] << 8) | ptr[3];
        f->ip.identification = (ptr[4] << 8) | ptr[5];
        f->ip.flags_fragment = (ptr[6] << 8) | ptr[7];
        f->ip.ttl            = ptr[8];
        f->ip.protocol       = ptr[9];
        f->ip.headerChecksum = (ptr[10] << 8) | ptr[11];
        memcpy(f->ip.srcIP, ptr+12, 4);
        memcpy(f->ip.dstIP, ptr+16, 4);
        uint8_t ip_header_len = (f->ip.version_ihl & 0x0F) * 4;
        uint16_t payload_len  = f->ip.totalLength - ip_header_len;
        ptr += ip_header_len;  // move pointer to start of payload
        memcpy(f->data, ptr, payload_len);
        // --- UDP ---
        if (f->ip.protocol == 0x11 && len >= 42) {
            f->udp.srcPort  = (ptr[0] << 8) | ptr[1];
            f->udp.dstPort  = (ptr[2] << 8) | ptr[3];
            f->udp.length   = (ptr[4] << 8) | ptr[5];
            f->udp.checksum = (ptr[6] << 8) | ptr[7];
            ptr += 8;

            uint16_t dataLen = f->udp.length - 8;
            if (dataLen > sizeof(f->data)) dataLen = sizeof(f->data);
            memcpy(f->data, ptr, dataLen);
        }

        // --- TCP (for MQTT detection) ---
        else if (f->ip.protocol == 0x06) {
            // Typical offsets: Ethernet (14) + IP (20) + TCP (20)
            const uint8_t *tcp_payload = buf + 14 + 20 + 20;
            uint8_t mqtt_type = tcp_payload[0];
            f->data[0] = mqtt_type; // store first byte for inspection


            if ((mqtt_type & 0xF0) == 0x10 ||  // CONNECT
                (mqtt_type & 0xF0) == 0x20 ||  // CONNACK
                (mqtt_type & 0xF0) == 0x30 ||  // PUBLISH
                (mqtt_type & 0xF0) == 0x80 ||  // SUBSCRIBE
                (mqtt_type & 0xF0) == 0x90 ||  // SUBACK
                (mqtt_type & 0xF0) == 0xC0 ||  // PINGREQ
                (mqtt_type & 0xF0) == 0xD0 ||  // PINGRESP
                (mqtt_type & 0xF0) == 0xE0) {
             is_mqtt = 1;
            }
        }
    }

    // --- Optional FCS ---
    if (len >= 4) {
        f->fcs = (buf[len-4] | (buf[len-3] << 8) |
                  (buf[len-2] << 16) | (buf[len-1] << 24));
    }
}

void sendreply(ENC28J60_Frame *rxFrame) {

    uint16_t len = 0;

    // --- Ethernet header ---
    memcpy(&txBuf[0], rxFrame->srcMAC, 6);   // dest MAC = original sender
    memcpy(&txBuf[6], myMAC, 6);             // src MAC = our ENC28J60 MAC

    // --- Branch by protocol type ---
    if (rxFrame->etherType == 0x0806) { // ARP
        // EtherType
        txBuf[12] = 0x08; txBuf[13] = 0x06;
        len = 14;

        // ARP reply
        txBuf[len++] = 0x00; txBuf[len++] = 0x01; // hw type = Ethernet
        txBuf[len++] = 0x08; txBuf[len++] = 0x00; // proto type = IPv4
        txBuf[len++] = 6;                         // hw size
        txBuf[len++] = 4;                         // proto size
        txBuf[len++] = 0x00; txBuf[len++] = 0x02; // opcode = reply

        memcpy(&txBuf[len], myMAC, 6); len += 6;  // sender MAC
        memcpy(&txBuf[len], myIP, 4); len += 4;   // sender IP
        memcpy(&txBuf[len], rxFrame->arp.senderMAC, 6); len += 6; // target MAC
        memcpy(&txBuf[len], rxFrame->arp.senderIP, 4); len += 4;  // target IP
    }
    else if (rxFrame->etherType == 0x0800) { // IPv4
        // EtherType
        txBuf[12] = 0x08; txBuf[13] = 0x00;
        len = 14;

        // --- IP header ---
        txBuf[len++] = 0x45; // version+IHL
        txBuf[len++] = 0x00; // TOS
        // total length will be filled later
        txBuf[len++] = 0x00; txBuf[len++] = 0x00;
        txBuf[len++] = 0x00; txBuf[len++] = 0x00; // ID
        txBuf[len++] = 0x00; txBuf[len++] = 0x00; // flags+frag
        txBuf[len++] = 64;                        // TTL
        txBuf[len++] = rxFrame->ip.protocol;      // protocol (ICMP/UDP)
        txBuf[len++] = 0x00; txBuf[len++] = 0x00; // checksum (calc later)

        memcpy(&txBuf[len], myIP, 4); len += 4;   // src IP = us
        memcpy(&txBuf[len], rxFrame->ip.srcIP, 4); len += 4; // dst IP = requester

        // --- Branch by IP protocol ---
        if (rxFrame->ip.protocol == 0x01) { // ICMP
            txBuf[len++] = 0x00; // type = echo reply
            txBuf[len++] = 0x00; // code
            txBuf[len++] = 0x00; txBuf[len++] = 0x00; // checksum (calc later)

            // copy rest of ICMP payload from request
            memcpy(&txBuf[len], rxFrame->data, rxFrame->ip.totalLength - 20);
            len += rxFrame->ip.totalLength - 20;
        }
        else if (rxFrame->ip.protocol == 0x11) { // UDP
            // swap ports
            txBuf[len++] = rxFrame->udp.dstPort >> 8;
            txBuf[len++] = rxFrame->udp.dstPort & 0xFF;
            txBuf[len++] = rxFrame->udp.srcPort >> 8;
            txBuf[len++] = rxFrame->udp.srcPort & 0xFF;

            uint16_t udpLen = rxFrame->udp.length;
            txBuf[len++] = udpLen >> 8;
            txBuf[len++] = udpLen & 0xFF;
            txBuf[len++] = 0x00; txBuf[len++] = 0x00; // checksum (optional)

            memcpy(&txBuf[len], rxFrame->data, udpLen - 8);
            len += udpLen - 8;
        			}
    		}

    // --- Write to TX buffer ---
    WriteControlRegPair(EWRPTL, ENC28J60_TX_BUF_START);
    WriteBufferMem(txBuf, len);
    WriteControlRegPair(ETXNDL, ENC28J60_TX_BUF_START + len - 1);

    // --- Trigger TX ---
    BitFieldSet(ECON1, ECON1_TXRTS_BIT);
}
void sendGratuitousARP(void)
{
    uint8_t *p = txBuf;
    uint16_t len = 0;

    // Ethernet header
    memset(p, 0xFF, 6); p += 6;          // dest MAC = broadcast
    memcpy(p, myMAC, 6); p += 6;         // src MAC = our MAC
    *p++ = 0x08; *p++ = 0x06;            // EtherType = ARP

    // ARP header
    *p++ = 0x00; *p++ = 0x01;            // hw type = Ethernet
    *p++ = 0x08; *p++ = 0x00;            // proto type = IPv4
    *p++ = 6;                            // hw size
    *p++ = 4;                            // proto size
    *p++ = 0x00; *p++ = 0x02;            // opcode = reply

    // ARP payload (gratuitous)
    memcpy(p, myMAC, 6); p += 6;         // sender MAC
    memcpy(p, myIP, 4); p += 4;          // sender IP
    memcpy(p, myMAC, 6); p += 6;         // target MAC = our MAC
    memcpy(p, myIP, 4); p += 4;          // target IP = our IP

    len = p - txBuf;

    WriteControlRegPair(EWRPTL, ENC28J60_TX_BUF_START);
       WriteBufferMem(txBuf, len);
       WriteControlRegPair(ETXNDL, ENC28J60_TX_BUF_START + len - 1);

       // --- Trigger TX ---
       BitFieldSet(ECON1, ECON1_TXRTS_BIT);
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
    if (GPIO_Pin == GPIO_PIN_12) {
    	BitFieldClear(EIE, 0x80);
    //	WriteControlReg(EIR, 0x00);   // or BitFieldClear(EIR, 0xF
        ethernet_irq_handler();

    }
}
