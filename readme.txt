
#p2p分析不错
https://blog.csdn.net/niyuelin1990/article/details/80195974

#eth scan,can see different token info
https://etherscan.io/tokens

#gusto
http://www.gustoboard.com/index.php/about-us/?lang=zh

#go api
https://studygolang.com/pkgdoc

#geth src study
https://github.com/ZtesoftCS/go-ethereum-code-analysis

#geth wiki
https://github.com/ethereum/go-ethereum/wiki

##keystore文件介绍,内部原理分析
https://ethfans.org/posts/what-is-an-ethereum-keystore-file

#签名介绍
https://www.jianshu.com/p/d622e1ec9470?from=singlemessage

##geth command install

#release address
https://geth.ethereum.org/downloads/

#how to install

1 ubuntu

2 centos
https://blog.csdn.net/qq_35753140/article/details/79463735


#fast mode
geth --fast --cache=1024 console


常用命令:

geth attach http://127.0.0.1:8545


在Ubuntu下，首先切换到打算运行的目录，目录下应该有配置好的piccgenesis.json文件，执行如下命令

basepath=$(cd `dirname $0`; pwd)

获取当前的目录

geth  --datadir "$basepath/chain" init piccgenesis.json 

创建数据存放地址并初始化创世块

geth --identity "PICCetherum"  --rpc  --rpccorsdomain "*" --datadir "$basepath/chain" --port "30303"  --rpcapi "db,eth,net,web3"--networkid 95518 console


http://www.cnblogs.com/tinyxiong/p/7898599.html

#test
go test -v -cpu 4 ./eth -run TestMethod


创建账户

使用以下命令创建账户：

> personal.newAccount("TinyXiong")

TinyXiong为新账户的密码，回车后，返回一个新账户。

这时我们查看账户列表：

> eth.accounts

可以看到账户数组你包含两个账户，新账户在第二个（索引为1）位置。

现在看看账户的余额：

> eth.getBalance(eth.accounts[1])
0


给新账户转账

我们知道没有余额的账户是没法部署合约的，那我们就从默认账户转1以太币给新账户，使用以下命令（请使用你自己eth.accounts对应输出的账户）：

eth.sendTransaction({from: '0xb0ebe17ef0e96b5c525709c0a1ede347c66bd391', to: '0xf280facfd60d61f6fd3f88c9dee4fb90d0e11dfc', value: web3.toWei(1, "ether")})

解锁账户

在部署合约前需要先解锁账户（就像银行转账要输入密码一样），使用以下命令：

personal.unlockAccount(eth.accounts[1],"TinyXiong");

"TinyXiong" 是之前创建账户时的密码
解锁成功后，账户就准备完毕啦，接下来就是编写合约代码。

> eth.pendingTransactions
[{
    blockHash: null,
    blockNumber: null,
    from: "0x3222d99f33320b81fa3411643ab40d01981aa71f",
    gas: 90000,
    gasPrice: 18000000000,
    hash: "0x6b2662fef9cf743fcdb9425575ce7ba89f694f796d994ab1bcae1bedef7b5872",
    input: "0x",
    nonce: 0,
    r: "0xb03890caeb9bae98aecbaa5d0c6d84a33eaa094fd8072592acae4654810c1c2b",
    s: "0x191bb672d026e9cc4fd09d4aae9fba7dd7ed6e7d9b52752c1582da2e6ab52469",
    to: "0xd7734b1a2e457ec13779f4beaab7b604cbdb57c7",
    transactionIndex: 0,
    v: "0x11a",
    value: 1000000000000000000
}]


#unlock
personal.unlockAccount(eth.accounts[0])


#获取交易内容
> eth.getTransactionReceipt('0xcbf4d60ce1317ddf526bf81b080fbabb6a1e717b9cd854d24a2b682e57c941f9')
{
  blockHash: "0x67cce82dc45cf1f2e748259e5f6335b91b2c16179e454759b0dd91d24032dcd3",
  blockNumber: 1279,
  contractAddress: null,
  cumulativeGasUsed: 21000,
  from: "0x5d860f37c1291707a806d302d10bc09705f2aa84",
  gasUsed: 21000,
  logs: [],
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  root: "0x10802c226e10ac961ab1e4d5573d99af9a2fd50bb9c33bb2d946ccebb8870f6c",
  to: "0x445ef3961a305c27597736c194b2aee48f945a4b",
  transactionHash: "0xcbf4d60ce1317ddf526bf81b080fbabb6a1e717b9cd854d24a2b682e57c941f9",
  transacti

#获取具体交易信息
> eth.getTransaction("0xcbf4d60ce1317ddf526bf81b080fbabb6a1e717b9cd854d24a2b682e57c941f9")
{
  blockHash: "0x67cce82dc45cf1f2e748259e5f6335b91b2c16179e454759b0dd91d24032dcd3",
  blockNumber: 1279,
  from: "0x5d860f37c1291707a806d302d10bc09705f2aa84",
  gas: 121000,
  gasPrice: 18000000000,
  hash: "0xcbf4d60ce1317ddf526bf81b080fbabb6a1e717b9cd854d24a2b682e57c941f9",
  input: "0x",
  nonce: 23,
  r: "0x5a026280f101eb322da119bb100f4968ec845dbcd569233fc483bb54860a70dd",
  s: "0x1b952ab34220c569be1af2e1c95f852f91c08422110fd4df37693ec1ac6bb145",
  to: "0x445ef3961a305c27597736c194b2aee48f945a4b",
  transactionIndex: 0,
  v: "0x119",
  value: 10000000000000000000
}


＃获取块信息



ck(1279)
{
  difficulty: 131072,
  extraData: "0xd783010803846765746886676f312e31308664617277696e",
  gasLimit: 1230989118,
  gasUsed: 21000,
  hash: "0x67cce82dc45cf1f2e748259e5f6335b91b2c16179e454759b0dd91d24032dcd3",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0xb609b77bbd462ddfd48d7c69f5b5ebd478a7f147",
  mixHash: "0xee27e63776392f8ac48e260970dbc2c9913544964da80e4e62d5a44f9c6acc6e",
  nonce: "0x5752bfe75627ecc1",
  number: 1279,
  parentHash: "0xc7351f5013bc5ad3a07c4c7965adf532d02edd18505e2d6ec61140169f3b8d41",
  receiptsRoot: "0x7a505b046fe7795bcce8302e4cf21e4a07c6e1129df33bbc89edd79b61ae6e20",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 654,
  stateRoot: "0x55f85a7f2d462677bd89aa3acd52e2820ef1cd9c9e4bedc02ec74174f446e965",
  timestamp: 1525674893,
  totalDifficulty: 170146099,
  transactions: ["0xcbf4d60ce1317ddf526bf81b080fbabb6a1e717b9cd854d24a2b682e57c941f9"],
  transactionsRoot: "0xd28095d5306099b2e3c18d777139421ba4d5dca21b98ca81dc90f7b8bca3e432",
  uncles: []
}
> 

	#创建以太私链
https://my.oschina.net/stevex/blog/746669
　注意将enode URL中[::]替换为新节点的IP地址，添加成功后运行admin.peers命令即可查看对等节点信息。
  具体配置可以看下该目录下的脚本文件

#PC enode


#add peer
admin.addPeer('enode://ddf2808f09a34e4b77eb7854be18decc760edce76aa4f1026f720a6c5d41b77db1a84238f4d8a54b143b2bf931647351f45de5748fbd288f7940a6d0436065b5@[192.168.80.11]:30000')

admin.peers


enode: "enode://ddf2808f09a34e4b77eb7854be18decc760edce76aa4f1026f720a6c5d41b77db1a84238f4d8a54b143b2bf931647351f45de5748fbd288f7940a6d0436065b5@[::]:30000"

#192.168.80.11 public address
0x5d860f37c1291707a806d302d10bc09705f2aa84

#account　passwd:
123456
0xD4b00C103d85E789d094a1C373F7a1D02D6dEF44
0x445eF3961a305C27597736C194b2AeE48f945A4b
12345678

22345678
32345678
...

#contract address
0x71C5068584a8EaB709658bEB6132673d78C72555


#添加token,修改从eth到gusto

1  修改监听代币地址
 
2　修改计算代币的总balacne

3  修改token的转移命令

#预言机
http://www.oraclize.it/

#swarm
http://swarm-gateways.net/bzz:/swarm-gateways.eth/

#json rpc

for java,web3j
https://docs.web3j.io/

for ruby
gem install web3

for javascript
web3


<<<<<<< HEAD
#debug
start-debug.sh

http://localhost:6060/debug/pprof/
=======
##geth console example:

可以参考　https://blog.csdn.net/ddffr/article/details/76549320
1 
> var strAbi='[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"INITIAL_SUPPLY","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_subtractedValue","type":"uint256"}],"name":"decreaseApproval","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_addedValue","type":"uint256"}],"name":"increaseApproval","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]'

2 
> abi = JSON.parse(strAbi)

3 
> var contract = eth.contract(abi);

4 合同地址
var sigContractAddress= "0x163fda28FeA5356F051CC00e236d67006200B558";

5 获取合同实例
sigContractInstance =  contract.at(sigContractAddress)
 
或者上链
thesample=sample.new(1,{from:eth.accounts[0],data:SampleHEX,gas:3000000})

查询：
samplerecpt=eth.getTransactionReceipt("0xee74bcb4461c9712ec9aca96a5a3a4c3c64be1213854d519fc8e5432b554f7a1")


{
  abi: [{
      constant: true,
      inputs: [],
      name: "name",
      outputs: [{...}],
      payable: false,
      stateMutability: "view",
      type: "function"
  }, {
      constant: false,
      inputs: [{...}, {...}],
      name: "approve",
      outputs: [{...}],
      payable: false,
      stateMutability: "nonpayable",
      type: "function"
  }, {
      constant: true,
      inputs: [],
 ...............

6 获取账户balance 

var hello =sigContractInstance.balanceOf("0x5D860F37C1291707A806D302D10Bc09705F2Aa84");

7 转移
以下执行失败，没动静
var bSuccess = sigContractInstance.transfer.call("0x445eF3961a305C27597736C194b2AeE48f945A4b",10000);

#以下执行成功
var bSuccess = sigContractInstance.transfer.sendTransaction("0x445eF3961a305C27597736C194b2AeE48f945A4b",10000,{from:eth.accounts[0], gas:3000000});


例子：
samplecontract.get.call()
1

> samplecontract.set.sendTransaction(9, {from:eth.accounts[0], gas:3000000})

"0x822ee6fb4caceb7e844c533f7f3bc57806f7cb3676fb3066eb848cca46b2f38a"

> samplecontract.get.call()

9

rpc-json example:
{"jsonrpc":"2.0","method":"personal_unlockAccount","params":["0x5d860f37c1291707a806d302d10bc09705f2aa84","123456",36000],"id":"1"}

 RequestBody requestBody = RequestBody.create(JSON_MEDIA_TYPE, request);


{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from":"0xc3aadccf55b41d80d3792ee55af7316aee2ea5ab","to":"0x163fda28fea5356f051cc00e236d67006200b558","gas":"0x419ce0","gasPrice":"0x2328","data":"0xa9059cbb000000000000000000000000c517bffddc672b05804062031d21058d50519110000000000000000000000000000000000000000000000000000000000000c34b","nonce":"0x1e"}],"id":233}

转移代币：

> eth.getTransaction("0xfb85a411be23b7fe736a9a53aa64de48072cece1a6bc8c3d64117284ed35d43C")
{
  blockHash: "0x07b8bda26d922b04000e2d3b8317206d5ceee8ac371cd6a93b87bb3337e70d7d",
  blockNumber: 3524,
  from: "0xc3aadccf55b41d80d3792ee55af7316aee2ea5ab",
  gas: 4300000,
  gasPrice: 22000000000,
  hash: "0xfb85a411be23b7fe736a9a53aa64de48072cece1a6bc8c3d64117284ed35d43c",
  input: "0xa9059cbb000000000000000000000000c517bffddc672b05804062031d21058d505191100000000000000000000000000000000000000000000000000000000000001387",
  nonce: 78,
  r: "0x71eebdb8d453847a6023bbd2e3f5c1c7f767ae50def2e4130b90e0fceb0f7344",
  s: "0xe0008c8248898878a358b3295793b0616dfcbd141425a9650412fe9d6bf93ae",
  to: "0x163fda28fea5356f051cc00e236d67006200b558",
  transactionIndex: 4,
  v: "0x1b",
  value: 0
}


这里的是代币地址,value为０
 to: "0x163fda28fea5356f051cc00e236d67006200b558",
 
监听的log信息:

0 : Log{removed=false, logIndex='0x0', transactionIndex='0x0', transactionHash='0x94d0797ae517cda26053a2df5a7904674e9e1e6b3dc0c850ec06ba8b0aaa71e6', blockHash='0xa8654b7f6d9d364dd7b834aad6216c8ccdd6f7e1f895a3bd35521b6bc3332387', blockNumber='0xdfd', address='0x163fda28fea5356f051cc00e236d67006200b558', data='0x0000000000000000000000000000000000000000000000000000000000001387', type='null', topics=[0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef, 0x000000000000000000000000c3aadccf55b41d80d3792ee55af7316aee2ea5ab, 0x000000000000000000000000c517bffddc672b05804062031d21058d50519110]}
block num=3581,from=0xc3aadccf55b41d80d3792ee55af7316aee2ea5ab,to=0xc517bffddc672b05804062031d21058d50519110,amount=4999
need fast,current query blocknum=3582,last block num=3589


            return {
                topics: options.topics,
                from: options.from,
                to: options.to,
                address: options.address,
                fromBlock: formatters.inputBlockNumberFormatter(options.fromBlock),
                toBlock: formatters.inputBlockNumberFormatter(options.toBlock)
            };



> console.log(this)
< Filter {
<   requestManager: 
<    RequestManager {
<      provider: 
<       HttpProvider {
<         host: 'http://localhost:8545',
<         timeout: 0,
<         user: undefined,
<         password: undefined,
<         headers: undefined },
<      polls: {},
<      timeout: null },
<   options: 
<    { topics: 
<       [ '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef' ],
<      from: undefined,
<      to: undefined,
<      address: '0x163fda28fea5356f051cc00e236d67006200b558',
<      fromBlock: '0xdfe',
<      toBlock: '0xdfe' },
<   implementation: 
<    { newFilter: { [Function: send] request: [Function: bound ], call: [Function: newFilterCall] },
<      uninstallFilter: { [Function: send] request: [Function: bound ], call: 'eth_uninstallFilter' },
<      getLogs: { [Function: send] request: [Function: bound ], call: 'eth_getFilterLogs' },
<      poll: { [Function: send] request: [Function: bound ], call: 'eth_getFilterChanges' } },
<   filterId: null,
<   callbacks: [],
<   getLogsCallbacks: [],
<   pollFilters: [],
<   formatter: [Function: outputLogFormatter] }
> undefined
> n

#send raw transatcion

{"jsonrpc":"2.0","method":"eth_sendRawTransaction","params":["0xf86d5685051f4d5c0083419ce0944c4516d4ffb05d21ec26377df284d6aabce3f4aa8806f05b59d3b20000801ca0585b512b5906e5c9c9b78c21b28135e8289644e41811d4b34f073cbb52539de5a04e17618288715261b42ee95e7b5267682d9ee4c1d64e83a4569d0abbb90954b4"],"id":96}
>>>>>>> 3156269c28f617985d90504030af7e5fc2adf6d9
