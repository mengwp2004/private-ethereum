#!/bin/sh
basepath=$(cd `dirname $0`; pwd)
./wallet/ethereumwallet --node-datadir $basepath/chain  --rpc $basepath/chain/geth.ipc 

