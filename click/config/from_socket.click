obdsrc::FromSocket("UDP", 127.0.0.1, 20000);
obddst::ToSocket("UDP", 127.0.0.1, 20001);


//BRN2PacketSource(SIZE,INTERVAL (ms), hoechste Seqenznummer (danach von wieder von 0 anfangen), 0,0,0)
BRN2PacketSource(8, 5, 5, 0, 0, 0)
-> Print("Send: ",1000)
-> NotifierQueue(50)
-> obddst;

obdsrc
  -> pw :: Print("Receive: ",1000)
  -> Discard;
