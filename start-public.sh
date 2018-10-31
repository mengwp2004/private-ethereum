#!/bin/sh
nohup geth    --rpc  --rpcport 8545    --rpcapi "db,personal,eth,net,web3" > geth.nohup 2>&1 &
