#include<openbeacon.h>
#include<openbeacon_communication.h>

ob_data ob_int_buffer;
ob_Mgmt ob_int_mgmt;


void ob_init( unsigned char power, unsigned char rate, unsigned char channel, unsigned char* nid ) {
	char i;
	ob_int_mgmt.Mode 			= 0;
	ob_int_mgmt.Pipes			= 0;

    /* Inititalize nRF24L01 */
    if(!nRFAPI_Init(DEFAULT_CHANNEL, nid, NETID_SIZE ))
    	HaltBlinking();

    ob_setNetID( nid );
    ob_setRate( rate );
    ob_setPower( power );
    ob_setChannel( channel );
    nRFAPI_SetPipeSizeRX(0, sizeof(ob_data) );
    ob_switchRXMode();
    nRFLL_CE(1);

    /* initialize environment variables */
    env_init();
    if(!env_load())
    {
    	env.e.speed=2;
    	env.e.mode=4;
    	env.e.tag_id=666;
    	env_store();
    }

    /* Statistik */
    for(i=0; i<4; i++) {
    	ob_int_mgmt.rx_beacons[i] 		= 0;
    	ob_int_mgmt.fail_rx_beacons[i] 	= 0;
    	ob_int_mgmt.tx_beacons[i] 		= 0;
    	ob_int_mgmt.fail_tx_beacons[i] 	= 0;
    }

	#ifdef OPENBEACON_STATS_AUTO_SEND_TIME
		ob_int_mgmt.stat_time 		= xTaskGetTickCount()+OPENBEACON_STATS_AUTO_SEND_TIME/2;
	#else
		ob_int_mgmt.stat_time 		= xTaskGetTickCount()+1000/2;
	#endif

	#ifdef OPENBEACON_TEST_AUTO_SEND
		#ifdef OPENBEACON_TEST_AUTO_SEND_TIME
			ob_int_mgmt.test_hw_diff=OPENBEACON_TEST_AUTO_SEND_TIME;
		#else
			ob_int_mgmt.test_hw_diff=1000;
		#endif
	#endif
}

void ob_switchRXMode() {
	if(ob_int_mgmt.Mode!=1) {
		nRFLL_CE(1);
		nRFAPI_SetRxMode(1);
		ob_int_mgmt.Mode = 1;
	}
}

void ob_switchTXMode() {
	if(ob_int_mgmt.Mode!=2) {
		nRFLL_CE(0);
		nRFAPI_SetRxMode(0);
		ob_int_mgmt.Mode = 2;
	}
}

void ob_setRate( unsigned char r ) {
	unsigned char TxRate = r;
	if(TxRate==0) TxRate = ob_int_mgmt.TxRate; else TxRate--;

	if(TxRate>1) TxRate=1;

	ob_int_mgmt.TxRate = TxRate;
    nRFAPI_SetTxPowerRate(ob_int_mgmt.TxPowerLevel, ob_int_mgmt.TxRate);
}

void ob_setPower( unsigned char p ) {
	unsigned char TxPowerLevel = p;
	if(TxPowerLevel==0) TxPowerLevel = ob_int_mgmt.TxPowerLevel; else TxPowerLevel--;

	if(TxPowerLevel>3) TxPowerLevel=3;

	ob_int_mgmt.TxPowerLevel = TxPowerLevel;
    nRFAPI_SetTxPowerRate(ob_int_mgmt.TxPowerLevel, ob_int_mgmt.TxRate);
}

void ob_setChannel( unsigned char c ) {
	unsigned char TxChannel = c;
	if(TxChannel==0) TxChannel= ob_int_mgmt.TxChannel; else TxChannel--;

	if(TxChannel>125) TxChannel=125;

	ob_int_mgmt.TxChannel = TxChannel;
    nRFAPI_SetChannel( ob_int_mgmt.TxChannel );
}

void ob_setNetID( unsigned char* nid ) {
	char i;
	for(i=0; i<NETID_SIZE; i++) {
		ob_int_mgmt.NetID[i]=nid[i];
	}

	nRFAPI_SetTxMAC( ob_int_mgmt.NetID, NETID_SIZE);
	nRFAPI_SetRxMAC( ob_int_mgmt.NetID, NETID_SIZE, ob_int_mgmt.Pipes);
}

void increment(unsigned char* buff, unsigned char len) {
	unsigned char i;

	for(i=0; i<len; i++) {
		buff[i]++;
		if(buff[i]>0) break;
	}
}

signed char sendBeacon( ob_data* block )
{
    unsigned int i=0;
    unsigned long crc;

	ob_switchRXMode();

    if( nRFAPI_CarrierDetect()!=STATUS_CD ) {
    	ob_switchTXMode();

    	crc = env_crc16(block->payload, sizeof(block->payload) );
    	block->crc = swapshort(crc);

    	// upload data to nRF24L01
    	nRFAPI_TX((unsigned char*)block, sizeof(ob_data) );

    	// transmit data
    	nRFLL_CE(1);
		increment(ob_int_mgmt.tx_beacons, 4);
        return 0;
    }
	increment(ob_int_mgmt.fail_tx_beacons, 4);
    return -1;
}

unsigned char recvBeacon( ob_data* block ) {
    unsigned long crc;
    unsigned char ret=0, status;

	ob_switchRXMode();
	if((AT91F_PIO_GetInput(AT91C_BASE_PIOA)&IRQ_PIN)==0)
	{
		portENTER_CRITICAL();
			status=nRFAPI_GetStatus();
			if(status&MASK_RX_DR_FLAG ) {

				ret=nRFAPI_RX((unsigned char*)block, sizeof(ob_data) );

				if(ret>0) {
					// CRC Check
					crc = env_crc16(block->payload, sizeof(block->payload) );
					if(block->crc == swapshort(crc)) {
						increment(ob_int_mgmt.rx_beacons, 4);
					} else {
						increment(ob_int_mgmt.fail_rx_beacons, 4);
						ret=0;
					}
				}
				nRFAPI_FlushRX();
			}

			nRFAPI_ClearIRQ(status);
		portEXIT_CRITICAL ();
	}
	return ret;
}

char isFinishTransmit() {
	return (nRFAPI_GetStatus()&STATUS_TX_DS)==STATUS_TX_DS;
}


void sendBeaconStat( portTickType diff) {
	/* send Stats */
	if( xTaskGetTickCount()-ob_int_mgmt.stat_time>1) {
		AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_GREEN );
	}
	if( xTaskGetTickCount()-ob_int_mgmt.stat_time>diff ) {
		ob_int_mgmt.stat_time = xTaskGetTickCount();
	    MemBlock *h = pullFreeBlock();

	    if(h!=NULL) {
	    	OBD2HW_Header* c2ob_h;
	    	char* bh=(char*)h->pValue;
			c2ob_h	=(OBD2HW_Header*)bh;

			c2ob_h->length = sizeof(StatusOpenbeacon_V1);
			c2ob_h->type   = STATUS_OPENBEACON_V1;

			StatusOpenbeacon_V1* sbv1 =(StatusOpenbeacon_V1*)(bh+sizeof(OBD2HW_Header));
			char i;

			// Statistik eintragen
			for(i=0; i<OPENBEACON_MACSIZE; i++) sbv1->NetID[i]=ob_int_mgmt.NetID[i];
			sbv1->TxChannel 		= ob_int_mgmt.TxChannel;
			sbv1->TxPowerLevel 		= ob_int_mgmt.TxPowerLevel;
			sbv1->TxRate			= ob_int_mgmt.TxRate;
			for(i=0; i<4; i++) {
				sbv1->rx_beacons[i]			= ob_int_mgmt.rx_beacons[i];
				sbv1->fail_rx_beacons[i]	= ob_int_mgmt.fail_rx_beacons[i];
				sbv1->tx_beacons[i]			= ob_int_mgmt.tx_beacons[i];
				sbv1->fail_tx_beacons[i]	= ob_int_mgmt.fail_tx_beacons[i];
			}

			vUSBSendPriPacket(h, sizeof(OBD2HW_Header)+c2ob_h->length );
			h=NULL;

			// reset stat
			for(i=0; i<4; i++) {
				ob_int_mgmt.rx_beacons[i] 		= 0;
				ob_int_mgmt.fail_rx_beacons[i]	= 0;
				ob_int_mgmt.tx_beacons[i]		= 0;
				ob_int_mgmt.fail_tx_beacons[i]	= 0;
			}

			AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_GREEN );
	    }
	}
}

static inline unsigned short swapshort (unsigned short src)
{
	return (src>>8)|(src<<8);
}
static inline unsigned long swaplong (unsigned long src)
{
	return (src>>24)|(src<<24)|((src>>8)&0x0000FF00)|((src<<8)&0x00FF0000);
}
static inline void HaltBlinking(void)
{
    while(1)
    {
    	vTaskDelay (portTICK_RATE_MS * 500);
        AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_MASK );

        vTaskDelay (portTICK_RATE_MS * 500);
        AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_MASK );
    }
}
