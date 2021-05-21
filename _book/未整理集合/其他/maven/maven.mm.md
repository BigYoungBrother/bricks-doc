# maven
## maven仓库
### 本地仓库
#### 本地的jar包缓存, 项目首先在本地缓存中找jar包，没找到再去远程服务器上拉取
### 私服
#### 公司内部局域网的一台服务器
#### 私服中存储了本公司的内部专用的jar
#### 私服还充当了中央仓库的镜像
### 中心仓库
#### 存储了互联网上的jar，由Maven团队来维护
#### http://repo1.maven.org/maven2/

## dependency的使用

### groupId
### artifactId
### version
#### 开发版本(Snapshot)
##### 自动下载最新时间戳的Snapshot版本
#### 发布版本(Release)

## maven依赖冲突
### 对于Maven而言，同一个groupId同一个artifactId下，只能使用一个version
### 使用dependency中最下面的verison
### 依赖传递(transitive)
#### 如果A依赖B，B依赖C，那么引入A，意味着B和C都会被引入
### Maven的最近依赖策略
#### 在依赖树(mvn dependency:tree)中离项目最近的那个版本将会被使用
### 依赖冲突解决
#### `<dependencyManagement>`版本锁定
#### `<exclusions>`排除冲突的包
#### 直接在项目的pom中显式指定依赖版本

## 引入依赖的最佳实践
### `mvn dependency:tree`命令形成依赖树，看看我们新加入的依赖，是否存在传递依赖
## Maven规范化目录结构
### pom.xml
### src/main/java
### src/main/resources
### src/test/java
### src/test/resources
### src/main下内容最终会打包到Jar/War中，而src/test下是测试内容，并不会打包进去
### src/main/resources中的资源文件会COPY至目标目录，这是Maven的默认生命周期中的一个规定动作

## Maven的生命周期
### 执行后面的命令时，前面的命令自动得到执行
### clean
#### 有问题，多清理！
### package
#### 打成Jar or War包，会自动进行clean+compile
### install
#### 将本地工程Jar上传到本地仓库
### deploy
#### 上传到私服

## 关于scope依赖范围
### compile
#### 默认的scope，运行期有效，需要打入包中。
### provided
#### 编译期有效，运行期不需要提供，不会打入包中。
### runtime
#### 编译不需要，在运行期有效，需要导入包中。（接口与实现分离）
### test
#### 测试需要，不会打入包中。
### system
#### 非本地仓库引入、存在系统的某个路径下的jar。（一般不使用）