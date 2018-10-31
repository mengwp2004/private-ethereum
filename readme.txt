
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


#json rpc

for java,web3j
https://docs.web3j.io/

for ruby
gem install web3

for javascript
web3


#debug
start-debug.sh

http://localhost:6060/debug/pprof/
