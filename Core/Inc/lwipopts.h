/*
 * Copyright (c) 2001-2003 Swedish Institute of Computer Science.
 * All rights reserved. 
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission. 
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED 
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 * 
 * Author: Simon Goldschmidt
 *
 */
#ifndef LWIP_HDR_LWIPOPTS_H
#define LWIP_HDR_LWIPOPTS_H

/* ---------- Core settings ---------- */
#define NO_SYS                          0   /* Using FreeRTOS */
#define SYS_LIGHTWEIGHT_PROT            1   /* Enable lightweight protection */
#define LWIP_NETCONN                    1   /* Enable Netconn API */
#define LWIP_SOCKET                     0   /* Enable Socket API */

/* ---------- Protocols ---------- */
#define LWIP_IPV6                       0   /* IPv4 only */
#define LWIP_ARP                        1
#define LWIP_ICMP                       1
#define LWIP_UDP                        1
#define LWIP_TCP                        1
#define LWIP_DHCP                       0   /* Enable DHCP */
#define LWIP_DNS                        1   /* Enable DNS resolver */
#define LWIP_HTTPD						0
/* ---------- Memory pools ---------- */
#define MEM_ALIGNMENT                   4
#define MEM_SIZE                        8192   /* 8 KB heap for lwIP */
#define MEMP_NUM_PBUF                   16
#define MEMP_NUM_TCP_PCB                6
#define MEMP_NUM_UDP_PCB                4
#define MEMP_NUM_TCP_SEG                8
#define MEMP_NUM_SYS_TIMEOUT            10

/* ---------- TCP settings ---------- */
#define TCP_MSS                         1460
#define TCP_SND_BUF                     (4 * TCP_MSS)
#define TCP_SND_QUEUELEN                8
#define TCP_WND                         (2 * TCP_MSS)
#define LWIP_WND_SCALE                  0
#define TCP_RCV_SCALE                   0
#define TCPIP_MBOX_SIZE 				16

/* ---------- PBUF pool ---------- */
#define PBUF_POOL_SIZE                  16

/* ---------- Statistics & debugging ---------- */
#define LWIP_STATS                      0
//#define LWIP_DEBUG                      0

/* ---------- Misc ---------- */
#define LWIP_HAVE_LOOPIF                0
#define LWIP_NETIF_LINK_CALLBACK        0
#define LWIP_NETIF_STATUS_CALLBACK      0
#define LWIP_PROVIDE_ERRNO
#define LWIP_TCPIP_CORE_LOCKING 		1

#endif /* LWIP_HDR_LWIPOPTS_H */

