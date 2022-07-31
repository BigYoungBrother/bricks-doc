# JVM参数

## 标准参数

标准参数，顾名思义，标准参数中包括功能以及输出的结果都是很稳定的，基本上不会随着JVM版本的变化而变化。

我们可以通过 `-help` 命令来检索出所有标准参数。

```java
C:\>java-help
        用法:java[-options]class [args...]
        (执行类)
        或 java[-options]-jar jarfile[args...]
        (执行 jar 文件)
        其中选项包括:
        -d32 使用 32位数据模型(如果可用)
        -d64 使用 64位数据模型(如果可用)
        -server 选择"server"VM
        默认 VM 是 server.

        -cp<目录和 zip/jar 文件的类搜索路径>
        -classpath<目录和 zip/jar 文件的类搜索路径>
        用;分隔的目录,JAR 档案
        和 ZIP 档案列表,用于搜索类文件。
        -D<名称>=<值>
                  设置系统属性
                          -verbose:[class|gc|jni]
        启用详细输出
        -version 输出产品版本并退出
        -version:<值>
                  警告:此功能已过时,将在
                          未来发行版中删除。
                          需要指定的版本才能运行
                          -showversion 输出产品版本并继续
                          -jre-restrict-search|-no-jre-restrict-search
                          警告:此功能已过时,将在
                          未来发行版中删除。
                          在版本搜索中包括/排除用户专用 JRE
                          -?-help 输出此帮助消息
                          -X 输出非标准选项的帮助
                          -ea[:<packagename>...|:<classname>]
        -enableassertions[:<packagename>...|:<classname>]
        按指定的粒度启用断言
        -da[:<packagename>...|:<classname>]
        -disableassertions[:<packagename>...|:<classname>]
        禁用具有指定粒度的断言
        -esa|-enablesystemassertions
        启用系统断言
        -dsa|-disablesystemassertions
        禁用系统断言
        -agentlib:<libname>[=<选项>]
        加载本机代理库<libname>,例如-agentlib:hprof
        另请参阅-agentlib:jdwp=help 和-agentlib:hprof=help
        -agentpath:<pathname>[=<选项>]
        按完整路径名加载本机代理库
        -javaagent:<jarpath>[=<选项>]
        加载 Java 编程语言代理,请参阅 java.lang.instrument
        -splash:<imagepath>
                  使用指定的图像显示启动屏幕
                          有关详细信息,请参阅 http://www.oracle.com/technetwork/java/javase/documentation/index.html。
```

## X参数

对应前面讲的标准化参数，这是非标准化参数。表示在将来的JVM版本中可能会发生改变，但是这类以`-X`开始的参数变化的比较小。

我们可以通过 `Java -X` 命令来检索所有`-X` 参数。

```java
C:\Users\Young>java-X
        -Xmixed 混合模式执行（默认）
        -Xint 仅解释模式执行
        -Xbootclasspath:<用; 分隔的目录和 zip/jar 文件>
        设置引导类和资源的搜索路径
        -Xbootclasspath/a:<用; 分隔的目录和 zip/jar 文件>
        附加在引导类路径末尾
        -Xbootclasspath/p:<用; 分隔的目录和 zip/jar 文件>
        置于引导类路径之前
        -Xdiag 显示附加诊断消息
        -Xnoclassgc 禁用类垃圾收集
        -Xincgc 启用增量垃圾收集
        -Xloggc:<file>    将 GC 状态记录在文件中（带时间戳）
        -Xbatch 禁用后台编译
        -Xms<size>        设置初始 Java 堆大小
        -Xmx<size>        设置最大 Java 堆大小
        -Xss<size>        设置 Java 线程堆栈大小
        -Xprof 输出 cpu 分析数据
        -Xfuture 启用最严格的检查，预计会成为将来的默认值
        -Xrs 减少 Java/VM 对操作系统信号的使用（请参阅文档）
        -Xcheck:jni 对 JNI 函数执行其他检查
        -Xshare:off 不尝试使用共享类数据
        -Xshare:auto 在可能的情况下使用共享类数据（默认）
        -Xshare:on 要求使用共享类数据，否则将失败。
        -XshowSettings 显示所有设置并继续
        -XshowSettings:system
        （仅限 Linux）显示系统或容器
        配置并继续
        -XshowSettings:all
        显示所有设置并继续
        -XshowSettings:vm 显示所有与 vm 相关的设置并继续
        -XshowSettings:properties
        显示所有属性设置并继续
        -XshowSettings:locale
        显示所有与区域设置相关的设置并继续

        -X 选项是非标准选项。如有更改，恕不另行通知。
```

## XX参数

这是我们日常开发中接触到最多的参数类型。这也是非标准化参数，相对来说不稳定，随着JVM版本的变化可能会发生变化，主要用于JVM调优和debug。

注意：这种参数是我们后续介绍JVM调优讲解最多的参数。

该参数的书写形式又分为两大类：Boolean类型和Key-Value类型

- Boolean类型；格式：-XX:[+-]<name> 表示启用或者禁用name属性。例子：-XX:+UseG1GC（表示启用G1垃圾收集器）
- Key-Value类型：格式：-XX:<name>=<value> 表示name的属性值为value。例子：-XX:MaxGCPauseMillis=500（表示设置GC的最大停顿时间是500ms）

## 常用参数

```java
// Java运行时数据区设置        
-Xms512M：设置堆内存初始值为512M,-X,memory start
        -Xmx1024M:设置堆内存最大值为1024M,-X,memory max
        -Xmn10M:设置新生代大小为10M,-X,memory new
        -Xss128k：设置每个线程的栈大小为128k。-X,stack size
        -XX:NewRatio=4:设置年轻代(包括Eden和两个Survivor区)与年老代的比值(除去持久代).设置为4,则年轻代与年老代所占比值为1:4,年轻代占整个堆栈的1/5
        -XX:SurvivorRatio=4:设置年轻代中Eden区与Survivor区的大小比值.设置为4,则两个Survivor区与一个Eden区的比值为2:4,一个Survivor区占整个年轻代的1/6
        -XX:MaxPermSize=16m:设置永久代大小为16m,JDK1.8之前
// JDK1.8之前设置永久代
        -XX:PermSize=N //方法区 (永久代) 初始大小
        -XX:MaxPermSize=N //方法区 (永久代) 最大大小,超过这个值将会抛出 OutOfMemoryError 异常:java.lang.OutOfMemoryError: PermGen
// JDK1.8之后设置元空间
        -XX:MetaspaceSize=N  //设置 Metaspace 的初始（和最小大小）
        -XX:MaxMetaspaceSize=N //设置 Metaspace 的最大大小  
        -XX:MaxTenuringThreshold=0:设置垃圾最大年龄.如果设置为0的话,则年轻代对象不经过Survivor区,直接进入年老代.对于年老代比较多的应用,可以提高效率.如果将此值设置为一个较大值,则年轻代对象会在Survivor区进行多次复制,这样可以增加对象再年轻代的存活 时间,增加在年轻代即被回收的概率

// 辅助信息
        -XX:+PrintCommandLineFlags // 打印已经被用户或者当前虚拟机设置过的参数
// 堆内存出现OOM的概率是所有内存耗尽异常中最高的，出错时的堆内信息对解决问题非常有帮助，所以给JVM设置这个参数(-XX:+HeapDumpOnOutOfMemoryError)，让JVM遇到OOM异常时能输出堆内信息，并通过（-XX:+HeapDumpPath）参数设置堆内存溢出快照输出的文件地址，这对于特别是对相隔数月才出现的OOM异常尤为重要。        
        -XX:+HeapDumpOnOutOfMemoryError
        -XX:HeapDumpPath
        -XX:OnOutOfMemoryError // -XX:OnOutOfMemoryError="./jconsole.exe" 表示发生OOM后，运行jconsole.exe程序。利用这个参数，我们可以在系统OOM后，自定义一个脚本，可以用来发送邮件告警信息，可以用来重启系统等等。
// 打印GC信息
        -verbose:gc
        -XX:+PrintGC
        // 输出形式:[GC 118250K->113543K(130112K), 0.0094143 secs]
        // [Full GC 121376K->10414K(130112K), 0.0650971 secs]        
        -XX:+PrintGCDetails // 打印详细的GC
        // 输出形式:[GC [DefNew: 8614K->781K(9088K), 0.0123035 secs] 118250K->113543K(130112K), 0.0124633 secs]
        // [GC [DefNew: 8614K->8614K(9088K), 0.0000665 secs][Tenured: 112761K->10414K(121024K), 0.0433488 secs] 121376K->10414K(130112K), 0.0436268 secs]
        -XX:+PrintGCTimeStamps    // 与上述两公个混合使用
        // 输出形式:11.851: [GC 98328K->93620K(130112K), 0.0082960 secs]
        -XX:+PrintGCApplicationConcurrentTime:打印每次垃圾回收前,程序未中断的执行时间.可与上面混合使用
        // 输出形式:Application time: 0.5291524 seconds
        -XX:+PrintGCApplicationStoppedTime:打印垃圾回收期间程序暂停的时间.可与上面混合使用
        // 输出形式:Total time for which application threads were stopped: 0.0468229 seconds        
        -XX:PrintHeapAtGC:打印GC前后的详细堆栈信息
        输出形式:
        34.702:[GC{Heap before gc invocations=7:
        def new generation total 55296K,used 52568K[0x1ebd0000,0x227d0000,0x227d0000)
        eden space 49152K,99%used[0x1ebd0000,0x21bce430,0x21bd0000)
        from space 6144K,55%used[0x221d0000,0x22527e10,0x227d0000)
        to space 6144K,0%used[0x21bd0000,0x21bd0000,0x221d0000)
        tenured generation total 69632K,used 2696K[0x227d0000,0x26bd0000,0x26bd0000)
        the space 69632K,3%used[0x227d0000,0x22a720f8,0x22a72200,0x26bd0000)
        compacting perm gen total 8192K,used 2898K[0x26bd0000,0x273d0000,0x2abd0000)
        the space 8192K,35%used[0x26bd0000,0x26ea4ba8,0x26ea4c00,0x273d0000)
        ro space 8192K,66%used[0x2abd0000,0x2b12bcc0,0x2b12be00,0x2b3d0000)
        rw space 12288K,46%used[0x2b3d0000,0x2b972060,0x2b972200,0x2bfd0000)
        34.735:[DefNew:52568K->3433K(55296K),0.0072126secs]55264K->6615K(124928K)Heap after gc invocations=8:
        def new generation total 55296K,used 3433K[0x1ebd0000,0x227d0000,0x227d0000)
        eden space 49152K,0%used[0x1ebd0000,0x1ebd0000,0x21bd0000)
        from space 6144K,55%used[0x21bd0000,0x21f2a5e8,0x221d0000)
        to space 6144K,0%used[0x221d0000,0x221d0000,0x227d0000)
        tenured generation total 69632K,used 3182K[0x227d0000,0x26bd0000,0x26bd0000)
        the space 69632K,4%used[0x227d0000,0x22aeb958,0x22aeba00,0x26bd0000)
        compacting perm gen total 8192K,used 2898K[0x26bd0000,0x273d0000,0x2abd0000)
        the space 8192K,35%used[0x26bd0000,0x26ea4ba8,0x26ea4c00,0x273d0000)
        ro space 8192K,66%used[0x2abd0000,0x2b12bcc0,0x2b12be00,0x2b3d0000)
        rw space 12288K,46%used[0x2b3d0000,0x2b972060,0x2b972200,0x2bfd0000)
        }
        ,0.0757599secs]

        -Xloggc:filename:与上面几个配合使用,把相关日志信息记录到文件以便分析.例如-Xloggc:./gc.log

// 垃圾回收器设置
        -XX:+UseSerialGC:设置串行收集器
        -XX:+UseParallelGC:设置并行收集器
        -XX:+UseParalledlOldGC:设置并行年老代收集器
        -XX:+UseConcMarkSweepGC:设置并发收集器
        -XX:ParallelGCThreads=n:设置并行收集器收集时使用的CPU数.并行收集线程数.
        -XX:MaxGCPauseMillis=n:设置并行收集最大暂停时间
        -XX:GCTimeRatio=n:设置垃圾回收时间占程序运行时间的百分比.公式为1/(1+n)
        -XX:+CMSIncrementalMode:设置为增量模式.适用于单CPU情况.
        -XX:ParallelGCThreads=n:设置并发收集器年轻代收集方式为并行收集时,使用的CPU数.并行收集线程数.

```

## 经验总结

### 年轻代大小选择

- 响应时间优先的应用:尽可能设大,直到接近系统的最低响应时间限制(根据实际情况选择).在此种情况下,年轻代收集发生的频率也是最小的.同时,减少到达年老代的对象.
- 吞吐量优先的应用:尽可能的设置大,可能到达Gbit的程度.因为对响应时间没有要求,垃圾收集可以并行进行,一般适合8CPU以上的应用.

### 老年代大小选择

1. 响应时间优先的应用:
   年老代使用并发收集器,所以其大小需要小心设置,一般要考虑并发会话率和会话持续时间等一些参数.如果堆设置小了,可以会造成内存碎片,高回收频率以及应用暂停。而使用传统的标记清除方式，如果堆大了,则需要较长的收集时间.最优化的方案,一般需要参考以下数据获得:

- 并发垃圾收集信息
- 持久代并发收集次数
- 传统GC信息
- 花在年轻代和年老代回收上的时间比例

减少年轻代和年老代花费的时间,一般会提高应用的效率

2. 吞吐量优先的应用

一般吞吐量优先的应用都有一个很大的年轻代和一个较小的年老代. 这样可以尽可能回收掉大部分短期对象,减少中期的对象,而年老代尽存放长期存活对象.

4. 较小堆引起的碎片问题

因为年老代的并发收集器使用标记清除算法,所以不会对堆进行压缩.当收集器回收时,他会把相邻的空间进行合并,这样可以分配给较大的对象.但是当堆空间较小时,运行一段时间以后,就会出现"碎片"
,如果并发收集器找不到足够的空间,那么并发收集器将会停止,然后使用传统的标记,清除方式进行回收.如果 出现"碎片",可能需要进行如下配置:

- -XX:+UseCMSCompactAtFullCollection:使用并发收集器时,开启对年老代的压缩.
- -XX:CMSFullGCsBeforeCompaction=0:上面配置开启的情况下,这里设置多少次Full GC后,对年老代进行压缩

内存使用情况打印的方法:

```java
public static String getMemUsage(){
        long free=java.lang.Runtime.getRuntime().freeMemory();
        long total=java.lang.Runtime.getRuntime().totalMemory();
        StringBuffer buf=new StringBuffer();
        buf.append("[Mem: used ").append((total-free)>>20)
        .append("M free ").append(free>>20)
        .append("M total ").append(total>>20).append("M]");
        return buf.toString();
        }
```

### 堆内存分配

JVM初始分配的内存由-Xms指定,默认是物理内存的1/64; JVM最大分配的内存由-Xmx指定,默认是物理内存的1/4，默认空余堆内存小于40%时,JVM就会增大堆直到-Xmx的最大限制;空余堆内存大于70%时,
JVM会减少堆直到-Xms的最小限制.因此服务器一般设置-Xms,-Xmx相等以避免在每次GC后调整堆的大小.

### 非堆内存分配

JVM使用-XX:PermSize设置非堆内存初始值,默认是物理内存的1/64;由XX:MaxPermSize设置最大非堆内存的大小,默认是物理内存的1/4.

### JVM内存限制(最大值)

首先JVM内存首先受限于实际的最大物理内存,假设物理内存无限大的话,JVM内存的最大值跟操作系统有很大的关系.简单的说就32位处理器虽然可控内存空间有4GB,但是具体的操作系统会给一个限制,这个限制一般是 2GB-3GB(
一般来说Windows系统下为1.5G-2G,Linux系统下为2G-3G),而64bit以上的处理器就不会有限制了

### JVM内存的调优

1. Heap设定与垃圾回收

Java Heap分为3个区,Young,
Old和Permanent。Young保存刚实例化的对象.当该区被填满时,GC会将对象移到Old区.Permanent区则负责保存反射对象,本文不讨论该区.JVM的Heap分配可以使用-X参数设定,

- -Xms 初始Heap大小
- -Xmx java heap最大值
- -Xmn young generation的heap大小

JVM有2个GC线程.第一个线程负责回收Heap的Young区.第二个线程在Heap不足时,遍历Heap,将Young区升级为Older区.Older区的大小等于-Xmx减去-Xmn,不能将-Xms的值设的过大,因为第二个线程被迫运行会降低JVM的性能.

为什么一些程序频繁发生GC?有如下原因:

- 程序内调用了System.gc()或Runtime.gc().
- 一些中间件软件调用自己的GC方法,此时需要设置参数禁止这些GC.
- Java的Heap太小,一般默认的Heap值都很小.
- 频繁实例化对象,Release对象.此时尽量保存并重用对象,例如使用StringBuffer()和String().

如果你发现每次GC后,Heap的剩余空间会是总空间的50%,这表示你的Heap处于健康状态.许多Server端的Java程序每次GC后最好能有65%的剩余空间.经验之谈:

- Server端JVM最好将-Xms和-Xmx设为相同值.为了优化GC,最好让-Xmn值约等于-Xmx的1/3.
- 一个GUI程序最好是每10到20秒间运行一次GC,每次在半秒之内完成.

注意:

- 增加Heap的大小虽然会降低GC的频率,但也增加了每次GC的时间.并且GC运行时,所有的用户线程将暂停,也就是GC期间,Java应用程序不做任何工作.
- Heap大小并不决定进程的内存使用量.进程的内存使用量要大于-Xmx定义的值,因为Java为其他任务分配内存,例如每个线程的Stack等.

2. Stack的设定

每个线程都有他自己的Stack.-Xss 每个线程的Stack大小，Stack的大小限制着线程的数量.如果Stack过大就好导致内存溢漏.-Xss参数决定Stack大小,例如-Xss1024K.如果Stack太小,也会导致Stack溢漏.

3. 硬件环境

硬件环境也影响GC的效率,例如机器的种类,内存,swap空间,和CPU的数量.
如果你的程序需要频繁创建很多transient对象,会导致JVM频繁GC.这种情况你可以增加机器的内存,来减少Swap空间的使用.

4. 4种GC

- 第一种为单线程GC,也是默认的GC.,该GC适用于单CPU机器.
- 第二种为Throughput GC,是多线程的GC,适用于多CPU,使用大量线程的程序.第二种GC与第一种GC相似,不同在于GC在收集Young区是多线程的,但在Old区和第一种一样,仍然采用单线程.-XX:
  +UseParallelGC参数启动该GC.
- 第三种为Concurrent Low Pause GC,类似于第一种,适用于多CPU,并要求缩短因GC造成程序停滞的时间.这种GC可以在Old区的回收同时,运行应用程序.-XX:+UseConcMarkSweepGC参数启动该GC.
- 第四种为Incremental Low Pause GC,适用于要求缩短因GC造成程序停滞的时间.这种GC可以在Young区回收的同时,回收一部分Old区对象.-Xincgc参数启动该GC.

## 参考

- [Java虚拟机详解（五）------JVM参数（持续更新）](https://www.cnblogs.com/ysocean/p/11109018.html)
- [轻松永远记住经典jvm参数](https://zhuanlan.zhihu.com/p/127352212)
- [java jvm 参数 -Xms -Xmx -Xmn -Xss 调优总结](https://www.cnblogs.com/jpfss/p/8618297.html)