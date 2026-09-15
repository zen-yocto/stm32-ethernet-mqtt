/*
 * tcp_test.h
 *
 *  Created on: Sep 2, 2026
 *      Author: Home
 */

#ifndef SRC_TCP_TEST_H_
#define SRC_TCP_TEST_H_


#include "lwip/tcp.h"
#include "lwip/ip_addr.h"
#include "lwip/err.h"
#include "lwip/api.h"
#include <string.h>
#include <stdio.h>
extern uint8_t tcp_busy;
// Initialize TCP client connection to Google
void tcp_client_init(void);
void send_test_publish(struct netif *netif);
// Callback when connection is established


// Callback when data is received
err_t tcp_client_recv(void *arg, struct tcp_pcb *pcb, struct pbuf *p, err_t err);

int mqtt_socket_connect(void);

#endif /* SRC_TCP_TEST_H_ */
