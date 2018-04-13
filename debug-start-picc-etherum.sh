#!/bin/sh
basepath=$(cd `dirname $0`; pwd)
#dlv exec  go-ethereum-master/build/bin/geth 
../go-ethereum-master/build/bin/geth --identity "PICCetherum"  --rpc  --rpcport 7545 --rpccorsdomain "*" --datadir "$basepath/chain" --port "30303"  --rpcapi "db,eth,net,web3" --networkid 12345  console
