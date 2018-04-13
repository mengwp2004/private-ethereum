#!/bin/sh
basepath=$(cd `dirname $0`; pwd)
geth --identity "PICCetherum-1"  --rpc  --rpcport 7545 --rpccorsdomain "*" --datadir "$basepath/chain2" --port "30304"  --rpcapi "db,eth,net,web3" --networkid 12345 --bootnodes "enode://09b160269173c9f195ad4130ee6724f599d1aa6b9852917b5b8e48bd9967617e80a5919a74b4cbd988686a726b936207cf2d7c618ccc97daae9f08e582069db5@[192.168.80.11]:30303" console
