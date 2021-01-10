# Spring和Spring Boot的区别

## 什么是Spring

### Spring框架为开发Java应用程序提供了全面的基础架构支持。它包含一些很好的功能，如依赖注入和开箱即用的模块，如：`SpringJDBC`、`SpringMVC`、`SpringSecurity`、`SpringAOP`、`SpringORM`、`SpringTest`

## 什么是Spring Boot

### Spring Boot基本上是Spring框架的扩展，它消除了设置Spring应用程序所需的XML配置
### 创建独立的Spring应用；
### 嵌入Tomcat、Jetty、Undertow容器(无需部署war文件)
### 提供starters简化构建配置
### 尽可能自动装配Spring应用
### 提供生产指标，例如健壮检查和外部化配置
### 完全没有代码生成和XML配置要求

## Spring和Spring Boot对别

### 配置
#### spring boot中有很多starter，已经按照默认的习惯配置，开箱即用
### 应用程序启动引导配置
#### spring一般需要依赖tomcat容器等启动，需要配置web.xml
#### spring Boot只需要在启动类上面注解`@SpringBootApplication`
### 部署

#### spring 需要tomcat等容器
#### spring Boot已经内嵌了Tomcat容器
##### 提供嵌入式容器支持
##### 使用命令`java -jar`独立运行`jar`
##### 在外部容器中部署时，可以选择排除依赖关系以避免潜在的`jar`冲突
##### 部署时灵活指定配置文件的选项
##### 用于集成测试的随机端口生成
## 结论
### `SpringBoot`只是`Spring`本身的扩展，使开发，测试和部署更加方便