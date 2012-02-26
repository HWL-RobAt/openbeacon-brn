
// verschiebt den begin der Arbeit um APPLICATION_START_TIME
#define APPLICATION_START_TIME				2000

// aktiviert die Verarbeitung diverser Konfigurationsparameter
#define APPLICATION_USBSHELL

// DEBUG: aktiviert das versenden von ob_Mgmt Informationen
#define OPENBEACON_STATS_AUTO_SEND
#define OPENBEACON_STATS_AUTO_SEND_TIME		1000

// DEBUG: aktiviert das versenden von ob_Mgmt Informationen
#define USB_STATS_AUTO_SEND
#define USB_STATS_AUTO_SEND_TIME			1000

// TEST: versendet Packete über Wireless im HW_rxtx_Test Format
#define OPENBEACON_TEST_AUTO_SEND
#define OPENBEACON_TEST_AUTO_SEND_TIME		255    // >250 == off

#define OPENBEACON_TRANSMIT_WIRELESS_TO_USB
#define OPENBEACON_RECIVE_WIRELESS
#define OPENBEACON_SEND_WIRELESS			1   // sollte grösser als 0 sein ==> Packet wird alle 2 Ticks=2ms abgesetzt

#define OPENBEACON_SEND_USB_PACKET_DATA
