
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
