
- [1. 概述](#1-概述)
- [2. 什么是`Spring`](#2-什么是spring)
- [3. 什么是SpringBoot](#3-什么是springboot)
- [4. Spring和Spring Boot对比](#4-spring和spring-boot对比)
  - [01 配置](#01-配置)
    - [0x01 Maven配置](#0x01-maven配置)
    - [0x02 MVC配置](#0x02-mvc配置)
    - [0x03 配置模板引擎](#0x03-配置模板引擎)
    - [0x04 `SpringSecurity`配置](#0x04-springsecurity配置)
  - [02 应用程序启动引导配置](#02-应用程序启动引导配置)
    - [0x01 `Spring` 引导配置](#0x01-spring-引导配置)
    - [0x02 `Spring Boot` 引导配置](#0x02-spring-boot-引导配置)
  - [03 打包和部署](#03-打包和部署)
- [5. 结论](#5-结论)

## 1. 概述

[文章连接](https://mp.weixin.qq.com/s/0IDPJigYbUaFm6MmmdeJsA)，在次记录一下。

[思维导图](spring和spring-boot的区别-思维导图.html)

## 2. 什么是`Spring`

作为Java开发人员，大家对Spring都不陌生，简而言之，Spring框架为开发Java应用程序提供了全面的基础架构支持。它包含一些很好的功能，如依赖注入和开箱即用的模块，如：`SpringJDBC`、`SpringMVC`、`SpringSecurity`、`SpringAOP`、`SpringORM`、`SpringTest`，这些模块缩短应用程序的开发时间，提高了应用开发的效率，例如在`JavaWeb`开发的早期阶段，我们需要编写大量的代码来将记录插入到数据库中，但是通过使用`SpringJDBC`模块的`JDBCTemplate`，我们可以将操作简化为几行代码。

## 3. 什么是SpringBoot

Spring Boot基本上是Spring框架的扩展，它消除了设置Spring应用程序所需的XML配置，为更快，更高效的开发生态系统铺平了道路。

Spring Boot中的一些特征：
1. 创建独立的Spring应用；
2. 嵌入Tomcat、Jetty、Undertow容器(无需部署war文件)
3. 提供starters简化构建配置
4. 尽可能自动装配Spring应用
5. 提供生产指标，例如健壮检查和外部化配置
6. 完全没有代码生成和XML配置要求

## 4. Spring和Spring Boot对比

### 01 配置

#### 0x01 Maven配置

首先，让我们看一下使用Spring创建web应用程序所需的最小依赖项

```java
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-web</artifactId>
    <version>5.1.0.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>5.1.0.RELEASE</version>
</dependency>
```

与Spring不同，spring Boot只需要一个依赖项来启动和运行Web应用程序：

```java
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
    <version>2.0.6.RELEASE</version>
</dependency>
```
SpringBoot在进行构建期间，所有其他依赖项将自动添加到项目中。

另一个很好的例子就是测试库。我们通常使用`SpringTest`，`JUnit`，`Hamcrest`和`Mockito`库。在`Spring`项目中，我们应该将松油这些库添加为依赖项。但是在`Spring Boot`中，我们只需要添加`spring-boot-starter-test`依赖项来自动包含这些库。

Spring Boot为不同的Spring模块提供了许多依赖项。一些最常用的是：

`spring-boot-starter-data-jpa`,`spring-boot-starter-security`,`spring-boot-starter-test`,`spring-boot-starter-web`,`spring-boot-starter-thymeleaf`

#### 0x02 MVC配置

让我们来看一下Spring和Spring Boot创建JSPWeb应用程序所需的配置。

Spring需要定义调度程序servlet，映射和其他支持配置。我们使用web.xml文件或者Initializer类来完成此操作：

```java
public class MyWebAppInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext container) {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.setConfigLocation("com.pingfangushi");
          container.addListener(new ContextLoaderListener(context));
          ServletRegistration.Dynamic dispatcher = container
          .addServlet("dispatcher", new DispatcherServlet(context));
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/");
    }
}
```
还需要将@EnableWebMvc注释添加到@Configuration类，并定义一个试图解析器来从控制器返回的视图：

```java
@EnableWebMvc
@Configuration
public class ClientWebConfig implements WebMvcConfigurer { 
   @Bean
   public ViewResolver viewResolver() {
      InternalResourceViewResolver bean
        = new InternalResourceViewResolver();
      bean.setViewClass(JstlView.class);
      bean.setPrefix("/WEB-INF/view/");
      bean.setSuffix(".jsp");
      return bean;
   }
}
```

再看SpringBoot，一旦我们添加了Web启动程序，Spring Boot只需要再application配置文件中配置几个属性来完成如上操作：
```java
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
```

上面的所有`Spring`配置都是通过一个名为`auto-configuration`的过程`BootWeb starter`来自动包含的。

这意味着`Spring Boot`将查看应用程序中存在的依赖项、属性和bean，并根据这些依赖项，对属性和bean进行配置。当然，如果我们想要添加自己的自定义配置，那么SpringBoot自动装配将会退回。

#### 0x03 配置模板引擎

现在我们来看下如何再`Spring`和`SpringBoot`中配置`Thymeleaf`模板引擎。

在`Spring`中，我们需要为视图解析器添加`Thymeleaf-spring5`依赖项和一些配置：

```java
@Configuration
@EnableWebMvc
public class MvcWebConfig implements WebMvcConfigurer {
    @Autowired
    private ApplicationContext applicationContext;
    @Bean
    public SpringResourceTemplateResolver templateResolver() {
        SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
        templateResolver.setApplicationContext(applicationContext);
        templateResolver.setPrefix("/WEB-INF/views/");
        templateResolver.setSuffix(".html");
        return templateResolver;
    }
    @Bean
    public SpringTemplateEngine templateEngine() {
        SpringTemplateEngine templateEngine = new SpringTemplateEngine();
        templateEngine.setTemplateResolver(templateResolver());
        templateEngine.setEnableSpringELCompiler(true);
        return templateEngine;
    }
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        ThymeleafViewResolver resolver = new ThymeleafViewResolver();
        resolver.setTemplateEngine(templateEngine());
        registry.viewResolver(resolver);
    }
}
```

`SpringBoot`只需要`spring-boot-starter-thymeleaf`的依赖项来启用 `Web`应用程序中的 `Thymeleaf`支持

#### 0x04 `SpringSecurity`配置

为简单起见，我们使用框架默认的 `HTTPBasic`身份验证。让我们首先看一下使用 `Spring`启用 `Security`所需的依赖关系和配置。

`Spring`首先需要依赖 `spring-security-web`和 `spring-security-config` 模块。接下来， 我们需要添加一个扩展 `WebSecurityConfigurerAdapter`的类，并使用 `@EnableWebSecurity`注解：
```java
@Configuration
@EnableWebSecurity
public class CustomWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
          .withUser("admin")
            .password(passwordEncoder()
            .encode("password"))
          .authorities("ROLE_ADMIN");
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
          .anyRequest().authenticated()
          .and()
          .httpBasic();
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
```
这里我们使用 `inMemoryAuthentication`来设置身份验证。同样， `SpringBoot`也需要这些依赖项才能使其工作。但是我们只需要定义 `spring-boot-starter-security`的依赖关系，因为这会自动将所有相关的依赖项添加到类路径中。

### 02 应用程序启动引导配置

`Spring`和 `SpringBoot`中应用程序引导的基本区别在于 `servlet`。`Spring`使用 `web.xml` 或 `SpringServletContainerInitializer`作为其引导入口点。`SpringBoot`仅使用 `Servlet3`功能来引导应用程序，下面让我们详细来了解下

#### 0x01 `Spring` 引导配置

`Spring`支持传统的 `web.xml`引导方式以及最新的 `Servlet3+`方法。

配置 `web.xml`方法启动的步骤

`Servlet`容器（服务器）读取 `web.xml`

`web.xml`中定义的 `DispatcherServlet`由容器实例化

`DispatcherServlet`通过读取 `WEB-INF/{servletName}-servlet.xml`来创建 `WebApplicationContext`。最后， `DispatcherServlet`注册在应用程序上下文中定义的 `bean`

使用 `Servlet3+`方法的 `Spring`启动步骤

容器搜索实现 `ServletContainerInitializer`的类并执行 `SpringServletContainerInitializer`找到实现所有类 `WebApplicationInitializer`、`WebApplicationInitializer`创建具有 `XML` 或上下文 `@Configuration`类 `WebApplicationInitializer`创建 `DispatcherServlet`与先前创建的上下文。

#### 0x02 `Spring Boot` 引导配置
`Spring Boot` 应用程序的入口点是使用 @SpringBootApplication 注释的类
```java
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
```
默认情况下， `SpringBoot`使用嵌入式容器来运行应用程序。在这种情况下， `SpringBoot`使用 `public static void main`入口点来启动嵌入式`Web`服务器。此外，它还负责将 `Servlet`，`Filter`和 `ServletContextInitializerbean`从应用程序上下文绑定到嵌入式`servlet`容器。`SpringBoot`的另一个特性是它会自动扫描同一个包中的所有类或`Main`类的子包中的组件。

`SpringBoot`提供了将其部署到外部容器的方式。我们只需要扩展`SpringBootServletInitializer`即可：
```java
/**
 * War部署
 *
 * @author SanLi
 * Created by 2689170096@qq.com on 2018/4/15
 */
public class ServletInitializer extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configur (SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        super.onStartup(servletContext);
        servletContext.addListener(new HttpSessionEventPublisher());
    }
}
```
这里外部`servlet`容器查找在`war`包下的`META-INF`文件夹下`MANIFEST.MF`文件中定义的`Main-class`， `SpringBootServletInitializer`将负责绑定`Servlet`， `Filter`和`ServletContextInitializer`。

### 03 打包和部署

最后，让我们看看如何打包和部署应用程序。这两个框架都支持`Maven`和`Gradle`等通用包管理技术。但是在部署方面，这些框架差异很大。例如，`Spring Boot Maven`插件在 `Maven`中提供`SpringBoot`支持。它还允许打包可执行`jar`或`war`包并 就地运行应用程序。

在部署环境中`SpringBoot`对比`Spring`的一些优点包括：

1. 提供嵌入式容器支持
2. 使用命令`java -jar`独立运行`jar`
3. 在外部容器中部署时，可以选择排除依赖关系以避免潜在的`jar`冲突
4. 部署时灵活指定配置文件的选项
5. 用于集成测试的随机端口生成

## 5. 结论

简而言之，我们可以说`SpringBoot`只是`Spring`本身的扩展，使开发，测试和部署更加方便。

