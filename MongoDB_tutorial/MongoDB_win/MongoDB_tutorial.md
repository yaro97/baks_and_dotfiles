
## MongdoDB安装和配置

### win系统下配置PATH目录 D:\MongoDB\bin ；

### 简单启动测试（可忽略）

- 创建创建数据文件 `D:\MongoDB\db` ；

- 启动需要 mongod.exe 命令，启动时可以设置端口号，**建议使用配置文件启动**

    ```mysql
    mongod --dbpath D:\MongoDB\db
    mongod --dbpath D:\MongoDB\db --port=27000
    ```

- 当MongoDB服务启动后，需要使用 mongo {--port=27001}命令连接数据库；

- 查询所有数据库： show databases;

> 虽然以上代码实现了数据库的启动与连接操作，但是实际开发中，在MongoDNB启动的时候需要设置相应参数：端口号、是否启动用户验证、数据文件位置等。

### 配置文件启动（推荐）

- 创建创建数据文件 `D:\MongoDB\db` ；
- 创建日志文件 `D:\MongoDB\log\mongodb.log` ；
- 创建配置文件 `D:\MongoDB\mongodb.conf ` ；

在配置文件中填写如下内容：

```mysql
# 设置数据路径
dbpath = D:\MongoDB\db
# 设置日志路径
logpath = D:\MongoDB\log\mongodb.log
# 打开日志输出操作
logappend = true
# 进行用户管理设置如下内容
noauth = true #不适用任何认证
port = 27001
```

- 根据配置文件启动MongoDB数据库服务：`mongod -f D:\MongoDB\mongodb.conf ` ;
- 连接数据库 `mongo --port=27001` 

## 数据库常用操作命令
```mysql
# mongod --dbpath D:\MongoDB\db  # 不指定端口号启动数据库
# mongo #连接数据库
# mongod --dbpath D:\MongoDB\db --port=27000 # 指定端口号启动数据库，等号可以用空格代替
mongod -f D:\MongoDB\mongodb.conf #启动数据库，常用
mongo --port=27001 #连接数据库
show databases;
# use admin #切换到管理员
# db.shutdownServer() #关闭数据库服务
use mldn #切换到mldn数据库，不需要创建，自动创建mldn数据库
# db.createCollection("emp"); #创建集合（表），实际不常用
db.dept.insert({"deptno":10,"dname":"财务部","loc":"北京"}) # 插入数据（文档），自动创建集合
db.dept.find(); #查找所有数据
show collectios; #查看所有集合
db.dept.findOne(); #查看集合的一个文档
db.dept.remove({"_id":objectId("....")}) # 删除数据
var deptData1 = {...}; db.dept.updata({原数据ID}, deptData1) #更新数据，最麻烦，意义不大
db.dept.drop(); # 删除集合
db.dropDatabase(); #删除当前数据库
```

## GUI软件管理工具

推荐 `Robomongo` 已经改名为 `Robo 3T,` ，跨平台，有社区版本；使用Jetbrains家的IDE的话可以使用 `mongo plugin` 插件。

## MongoDB基础操作

具体参照上面的常用命令。

> 在MondogDB数据库里面是存在有数据库的概念的，但是没有模式（集合没有结构的，根据插入的内容动态改变结构；所有的信息都是按照文档保存的），保存数据的结构就是JSON结构，只不过在进行一些数据处理的时候才会使用到MongoDB自己的的一些操作符。

- 使用mldn数据库： `use mldn`

这个时候并没有创建mldn数据库，只有在数据库里面保存集合数据之后才会创建

- 创建一个集合(类似于表)--创建一个emp集合： `db.createCollection("emp");`

- 但是按照以上代码进行操作会很不正常，因为正常人使用MongoDB都是直接向里面保存一个数据。
  `db.dept.insert({"deptno":10,"dname":"财务部","loc":"北京"})`

- 查看所有集合： `show collectios;` MongoDB中的集合是自动创建的。

- 查看dept集合（表）的数据： `db.dept.find();` 括号内可以使用条件

传统数据库的表一旦创建，必须严格按照表的结构插入数据；但是MongoDB的集合是可以随意扩充的。

- 增加不规则数据：

```mysql
var deptData = {
    "deptno":20,
    "dname":"研发部",
    "loc":"20",
    "count":"20"
};
db.dept.insert(deptData);
```

- 关于ID的问题：在MongoDB集合中的每一行记录都会自动生成一个"_id"，他是由：时间戳、机器码、进程PID、计数器生成的。这是MongoDB自动生成的，不重复，不可修改；

- 查看单独的一个文档信息：`db.dept.findOne();`

- 删除一个文档信息：`db.dept.remove({"_id":objectId("....")}) # 删除数据`

- 更新数据，比较麻烦，操作意义不大：`var deptData1 = {...}; db.dept.updata({原数据ID}, deptData1)`

- 删除集合： `db.dept.drop();`

- 删除当前数据库： `db.dropDatabase();`


