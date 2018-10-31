#!/bin/sh
basepath=$(cd `dirname $0`; pwd)
geth --pprof --identity "PICCetherum"   --rpc  --rpcport 8545 --rpccorsdomain "*" --datadir "$basepath/chain" --port "30000"  --rpcapi "db,personal,eth,net,web3" --networkid 12345  console
