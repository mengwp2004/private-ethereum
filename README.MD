Building private ethereum network.

1 run script
  ./init-piccgenesis.sh

2 run script
  ./start-picc-etherum-console.sh

3 add peer

  admin.addPeer('enode://ddf2808f09a34e4b77eb7854be18decc760edce76aa4f1026f720a6c5d41b77db1a84238f4d8a54b143b2bf931647351f45de5748fbd288f7940a6d0436065b5@[192.168.80.11]:30000')

4 download wallet to wallet dir
  wallet name:ethereumwallet

5 run private wallet
  ./start-private.sh
