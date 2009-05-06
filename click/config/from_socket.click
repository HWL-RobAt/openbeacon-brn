obdsrc::FromSocket("UDP", 127.0.0.1, 20000);
obddst::ToSocket("UDP", 127.0.0.1, 20001);

BRN2PacketSource(128, 12, 5, 0, 0, 0)
-> Print("Send: ",1000)
-> NotifierQueue(50)
-> obddst;

obdsrc
  -> pw :: Print("Receive: ",1000)
  -> Discard;
