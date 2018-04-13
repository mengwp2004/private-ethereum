#!/bin/sh
rm -rf chain
basepath=$(cd `dirname $0`; pwd)
geth  --datadir "$basepath/chain2" init piccgenesis.json 
