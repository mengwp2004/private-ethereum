#!/bin/sh
rm -rf chain
basepath=$(cd `dirname $0`; pwd)
geth  --datadir "$basepath/chain" init piccgenesis.json 
