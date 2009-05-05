FromSocket("UDP", 127.0.0.1, 20000)
  -> pw :: Print("Receive: ",1000)
  ->Discard;
