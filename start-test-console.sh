#!/bin/sh
geth  --testnet --datadir  "/home/mengwp/data/test" --rpc  --rpcport 8545    --rpcapi "db,personal,eth,net,web3"  --minerthreads 6 console
