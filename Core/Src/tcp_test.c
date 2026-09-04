/*
 * tcp_test.c
 *
 *  Created on: Sep 2, 2026
 *      Author: Home
 */

#include "tcp_test.h"
uint8_t tcp_busy=0;
static err_t tcp_client_connected(void *arg, struct tcp_pcb *tpcb, err_t err)
{
    if (err != ERR_OK) {
        tcp_abort(tpcb);
        return err;
    }
    tcp_output(tpcb);
    // We reached SYN‑ACK → lwIP already sent ACK automatically.
    // Now immediately close the connection.
    tcp_close(tpcb);
    tcp_busy=0;
    return ERR_OK;
}

void tcp_client_init(void)
{
    ip_addr_t server_ip;
    struct tcp_pcb *pcb;

    // Your PC LAN IP
    IP4_ADDR(&server_ip, 104,18,37,76);
if(!tcp_busy){
    pcb = tcp_new();
    if (!pcb)
        return;

    // Register only the "connected" callback
    tcp_recv(pcb, NULL);   // no receive handler
    tcp_err(pcb, NULL);

    // Connect → lwIP sends SYN
    // When SYN‑ACK arrives, tcp_client_connected() is called
    tcp_connect(pcb, &server_ip, 80, tcp_client_connected);
    tcp_busy=1;
}
}
