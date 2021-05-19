启动:
# ApplicationContextInitializer
## org.springframework.boot.context.config.DelegatingApplicationContextInitializer
## org.springframework.boot.autoconfigure.SharedMetadataReaderFactoryContextInitializer
## org.springframework.boot.context.ContextIdApplicationContextInitializer
## org.springframework.boot.context.ConfigurationWarningsApplicationContextInitializer
## org.springframework.boot.rsocket.context.RSocketPortInfoApplicationContextInitializer
## org.springframework.boot.web.context.ServerPortInfoApplicationContextInitializer
## org.springframework.boot.autoconfigure.logging.ConditionEvaluationReportLoggingListener

# ApplicationListener
## org.springframework.boot.cloud.CloudFoundryVcapEnvironmentPostProcessor
## org.springframework.boot.context.config.ConfigFileApplicationListener
## org.springframework.boot.context.config.AnsiOutputApplicationListener
## rg.springframework.boot.context.logging.LoggingApplicationListener
## org.springframework.boot.context.logging.ClasspathLoggingApplicationListener
## org.springframework.boot.autoconfigure.BackgroundPreinitializer
## org.dromara.soul.web.logo.SoulLogo
## org.springframework.boot.context.config.DelegatingApplicationListene
## org.springframework.boot.builder.ParentContextCloserApplicationListener
## org.springframework.boot.ClearCachesApplicationListener
## org.springframework.boot.context.FileEncodingApplicationListener
## org.springframework.boot.liquibase.LiquibaseServiceLocatorApplicationListener

# SpringApplicationRunListener
## EventPublishingRunListener
### starting-ApplicationStartingEvent
### environmentPrepared-ApplicationEnvironmentPreparedEvent
### contextPrepared-ApplicationContextInitializedEvent
### contextLoaded-ApplicationPreparedEvent


AnnotationConfigServletWebServerApplicationContext
postProcessApplicationContext
applyInitializers--回调ApplicationContextInitializer列表中的对象




# 事件




