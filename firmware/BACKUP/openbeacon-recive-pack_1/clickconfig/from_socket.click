obdsrc::FromSocket("UDP", 127.0.0.1, 20000);
obddst::ToSocket("UDP", 127.0.0.1, 20001);


//BRN2PacketSource(SIZE,INTERVAL (ms), hoechste Seqenznummer (danach von wieder von 0 anfangen), 0,0,0)
//BRN2PacketSource(8, 100, 5, 0, 0, 0)
// Packet das dem Format des OpenbeaconPacketformat entspricht
RatedSource(\<AABBCCDDEE> ,10)
-> Print("Data: ",1000)
-> OpenBeaconEncap()
-> Print("After OpenBeaconEncap: ",1000)
-> NotifierQueue(50)
-> obddst;

obdsrc
  -> Print("Befor OpenBeaconDecap: ",1000)
  -> OpenBeaconDecap()
  -> Print("Data: ",1000)
  -> Discard;
