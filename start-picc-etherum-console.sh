#!/bin/sh
basepath=$(cd `dirname $0`; pwd)
geth --identity "PICCetherum"   --rpc  --rpcport 8545 --rpccorsdomain "*" --datadir "$basepath/chain" --port "30303"  --rpcapi "db,eth,net,web3" --networkid 12345  console
