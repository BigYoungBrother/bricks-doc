- [参考内容](#参考内容)
- [设计模式概念](#设计模式概念)
- [设计模式原则](#设计模式原则)
  - [01 开闭原则](#01-开闭原则)
  - [02 里氏替换原则](#02-里氏替换原则)
  - [03 依赖倒置原则](#03-依赖倒置原则)
  - [04 迪米特法则](#04-迪米特法则)
  - [05 接口隔离原则](#05-接口隔离原则)
  - [06 单一职责原则](#06-单一职责原则)
  - [07 合成复用原则](#07-合成复用原则)
- [设计模式](#设计模式)
  - [构建型](#构建型)
    - [01 单例模式](#01-单例模式)
      - [饿汉式](#饿汉式)
      - [懒汉式](#懒汉式)
    - [02 工厂模式](#02-工厂模式)
      - [简单工厂模式](#简单工厂模式)
      - [工厂模式](#工厂模式)
    - [03 抽象工厂模式](#03-抽象工厂模式)
    - [04 建造者模式](#04-建造者模式)
    - [05 原型模式](#05-原型模式)
      - [浅拷贝](#浅拷贝)
      - [深拷贝](#深拷贝)
  - [结构型](#结构型)
    - [06 代理模式](#06-代理模式)
      - [静态代理](#静态代理)
      - [动态代理](#动态代理)
    - [07 适配器模式](#07-适配器模式)
      - [类适配器](#类适配器)
      - [对象适配器](#对象适配器)
    - [08 装饰器模式](#08-装饰器模式)
    - [09 享元模式](#09-享元模式)
    - [10 组合模式](#10-组合模式)
    - [11 桥接模式](#11-桥接模式)
    - [12 外观模式](#12-外观模式)
  - [行为型](#行为型)
    - [13 模板方法模式](#13-模板方法模式)
    - [14 策略模式](#14-策略模式)
    - [15 观察者模式](#15-观察者模式)
    - [16 命令模式](#16-命令模式)
    - [17 责任链模式](#17-责任链模式)
    - [18 状态模式](#18-状态模式)
    - [19 中介者模式](#19-中介者模式)
    - [20 迭代器模式](#20-迭代器模式)
    - [21 访问者模式](#21-访问者模式)
    - [22 备忘录模式](#22-备忘录模式)
    - [23 解释器模式](#23-解释器模式)

# 参考内容

- https://www.zhihu.com/question/308850392

- http://c.biancheng.net/view/1338.html

- https://www.runoob.com/design-pattern/design-pattern-intro.html

- https://blog.csdn.net/A1342772/article/details/91349142

# 设计模式概念

软件设计模式（Software Design Pattern），又称设计模式，是一套被反复使用、多数人知晓的、经过分类编目的、代码设计经验的总结。它描述了在软件设计过程中的一些不断重复发生的问题，以及该问题的解决方案。

其目的是为了提高代码的可重用性、代码的可读性和代码的可靠性。

设计模式的本质是面向对象设计原则的实际运用，是对类的封装性、继承性和多态性以及类的关联关系和组合关系的充分理解。使用设计模式具有以下优点。

- 可以提高程序员的思维能力、编程能力和设计能力。
- 使程序设计更加标准化、代码编制更加工程化，使软件开发效率大大提高，从而缩短软件的开发周期。
- 使设计的代码可重用性高、可读性强、可靠性高、灵活性好、可维护性强。

# 设计模式原则

## 01 开闭原则

**对扩展开放，对修改关闭**。

在程序需要进行拓展的时候，不能去修改原有的代码，简言之，是为了使程序的扩展性好，易于维护和升级。

想要达到这样的效果，我们需要使用**接口**和**抽象类**

**Windows 的桌面主题设计：**Windows 的主题是桌面背景图片、窗口颜色和声音等元素的组合。用户可以根据自己的喜爱更换自己的桌面主题，也可以从网上下载新的主题。这些主题有共同的特点，可以为其定义一个抽象类（Abstract Subject），而每个具体的主题（Specific Subject）是其子类。用户窗体可以根据需要选择或者增加新的主题，而不需要修改原代码，所以它是满足开闭原则的，其类图如下：

![](./images/开闭原则.gif)

## 02 里氏替换原则

**子类应该可以完全替换父类**

也就是说在使用继承时，只扩展新功能，而不要破坏父类原有的功能（尽量不要重写父类中的方法）

此外：

子类中 方法的返回值类型  必须是  父类中方法的返回值类型或其子类

子类中  异常类型  必须是  父类中异常类型或其子类

## 03 依赖倒置原则

应该依赖于抽象，而不应依赖于具体的实现

其核心思想是：要**面向接口编程**，不要面向实现编程。

## 04 迪米特法则

又名「最少知道原则」

只与你的直接朋友交谈，不跟“陌生人”说话（Talk only to your immediate friends and not to strangers）

其含义是：如果两个软件实体无须直接通信，那么就不应当发生直接的相互调用，可以通过第三方转发该调用。其目的是降低类之间的耦合度，提高模块的相对独立性。

**明星与经纪人的关系：**明星由于全身心投入艺术，所以许多日常事务由经纪人负责处理，如与粉丝的见面会，与媒体公司的业务洽淡等。这里的经纪人是明星的朋友，而粉丝和媒体公司是陌生人，所以适合使用迪米特法则，其类图如下

![](./images/迪米特.gif)

## 05 接口隔离原则

客户端不应依赖它不需要的接口

如果一个接口在实现时，部分方法由于冗余被客户端空实现，则应该将接口拆分，让实现类只需依赖自己需要的接口方法（肥胖接口）

要求程序员尽量将臃肿庞大的接口拆分成更小的和更具体的接口，让接口中只包含客户感兴趣的方法。

**学生成绩管理程序：**学生成绩管理程序一般包含插入成绩、删除成绩、修改成绩、计算总分、计算均分、打印成绩信息、査询成绩信息等功能，如果将这些功能全部放到一个接口中显然不太合理，正确的做法是将它们分别放在输入模块、统计模块和打印模块等 3 个模块中，其类图下：

![](./images/接口隔离.gif)

## 06 单一职责原则

一个类只做一件事，一个类应该只有一个引起它修改的原因

**大学学生工作管理程序：**大学学生工作主要包括学生生活辅导和学生学业指导两个方面的工作，其中生活辅导主要包括班委建设、出勤统计、心理辅导、费用催缴、班级管理等工作，学业指导主要包括专业引导、学习辅导、科研指导、学习总结等工作。如果将这些工作交给一位老师负责显然不合理，正确的做 法是生活辅导由辅导员负责，学业指导由学业导师负责，其类图如下：

![](./images/单一职责.gif)

## 07 合成复用原则

尽量使用合成/聚合的方式，而不是使用继承

合成复用原则是通过将已有的对象纳入新对象中，作为新对象的成员对象来实现的，新对象可以调用已有对象的功能，从而达到复用。

**汽车分类管理程序：**汽车按“动力源”划分可分为汽油汽车、电动汽车等；按“颜色”划分可分为白色汽车、黑色汽车和红色汽车等。如果同时考虑这两种分类，其组合就很多。

如下所示是用继承关系实现的汽车分类的类图：

![](./images/合成复用-继承.gif)

从上图 可以看出用继承关系实现会产生很多子类，而且增加新的“动力源”或者增加新的“颜色”都要修改源代码，这违背了开闭原则，显然不可取。但如果改用组合关系实现就能很好地解决以上问题，其类图如下：

![](./images/合成复用-组合.gif)

# 设计模式

## 构建型

创建型模式的主要关注点是“怎样创建对象？”，它的主要特点是“将对象的创建与使用分离”。这样可以降低系统的耦合度，使用者不需要关注对象的创建细节，对象的创建由相关的工厂来完成。就像我们去商场购买商品时，不需要知道商品是怎么生产出来一样，因为它们由专门的厂商生产。

创建型模式分为以下几种。

- 单例（Singleton）模式：某个类只能生成一个实例，该类提供了一个全局访问点供外部获取该实例，其拓展是有限多例模式。
- 原型（Prototype）模式：将一个对象作为原型，通过对其进行复制而克隆出多个和原型类似的新实例。
- 工厂方法（FactoryMethod）模式：定义一个用于创建产品的接口，由子类决定生产什么产品。
- 抽象工厂（AbstractFactory）模式：提供一个创建产品族的接口，其每个子类可以生产一系列相关的产品。
- 建造者（Builder）模式：将一个复杂对象分解成多个相对简单的部分，然后根据不同需要分别创建它们，最后构建成该复杂对象。

以上 5 种创建型模式，除了工厂方法模式属于类创建型模式，其他的全部属于对象创建型模式

### 01 单例模式

单例模式非常常见，某个对象全局只需要一个实例时，就可以使用单例模式。它的优点也显而易见：

- 它能够避免对象重复创建，节约空间并提升效率
- 避免由于操作不同实例导致的逻辑错误

单例模式有两种实现方式：饿汉式和懒汉式。

#### 饿汉式

变量在声明时便初始化

没有加锁，执行效率会提高, 类加载时就初始化，浪费内存。

```java
public class HungrySingleton{

    private static final HungrySingleton instance = new HungrySingleton();
    
    /**
     * 其不能由外部实例化，所以构造函数是私有的
     */
    private HungrySingleton(){}
    
    public static HungrySingleton getInstance(){
        return instance;
    }
}
```

#### 懒汉式

类加载时没有生成单例，只有当第一次调用 getlnstance 方法时才去创建这个单例

**线程不安全**

```java
public class Singleton {  
    private static Singleton instance;  
    private Singleton (){}  
  
    public static Singleton getInstance() {  
        if (instance == null) {  
            instance = new Singleton();  
        }  
    	return instance;  
    }  
}
```

**线程安全**

必须加锁 synchronized 才能保证单例，但加锁会影响效率。
getInstance() 的性能对应用程序不是很关键（该方法使用不太频繁）。

```java
ublic class Singleton {  
    private static Singleton instance;  
    private Singleton (){}  
    public static synchronized Singleton getInstance() {  
        if (instance == null) {  
            instance = new Singleton();  
        }  
        return instance;  
    }  
}
```

**双重校验锁**

这种方式采用双锁机制，安全且在多线程情况下能保持高性能。
getInstance() 的性能对应用程序很关键。

把sychronized加在if(instance==null)判断语句里面，**保证instance未实例化的时候才加锁**

- 第一个if减少性能开销，第二个if避免生成多个对象实例。

现有三个线程A，B，C，假设线程A和线程B同时调用getSingleton()时，判断第一层if判断都为空，这时线程A先拿到锁，线程B在代码块外层等待。线程A进行第二层if判断，条件成立后new了一个新对象，创建完成，释放锁，线程B拿到锁，进行第二层if判断，singleton不为空，直接返回singleton释放锁，避免生成多个对象实例。线程线C调用getSingleton时第一层判断不成立，直接拿到singleton对象返回，避免进入锁，减少性能开销。

- new一个对象的代码是无法保证顺序性的，因此，需要使用另一个关键字volatile保证对象实例化过程的顺序性。

| Time | Thread A                        | Thread B                                        |
| :--- | :------------------------------ | :---------------------------------------------- |
| T1   | 检查到`uniqueSingleton`为空     |                                                 |
| T2   | 获取锁                          |                                                 |
| T3   | 再次检查到`uniqueSingleton`为空 |                                                 |
| T4   | 为`uniqueSingleton`分配内存空间 |                                                 |
| T5   | 将`uniqueSingleton`指向内存空间 |                                                 |
| T6   |                                 | 检查到`uniqueSingleton`不为空                   |
| T7   |                                 | 访问`uniqueSingleton`（此时对象还未完成初始化） |
| T8   | 初始化`uniqueSingleton`         |                                                 |

在这种情况下，T7时刻线程B对`uniqueSingleton`的访问，访问的是一个**初始化未完成**的对象。

```java
public class Singleton {  
    private volatile static Singleton singleton;  
    private Singleton (){}  
    public static Singleton getSingleton() {  
        if (singleton == null) {
            synchronized (Singleton.class) {  
                if (singleton == null) {  
                    singleton = new Singleton();  
                }
            }  
        }  
        return singleton;  
    }  
}
```

### 02 工厂模式

定义一个创建产品对象的工厂接口，将产品对象的实际创建工作推迟到具体子工厂类当中。

#### 简单工厂模式

工厂方法模式的一种特例

当我们需要一个苹果时，我们需要知道苹果的构造方法，需要一个梨子时，需要知道梨子的构造方法。更好的实现方式是有一个水果工厂，我们告诉工厂需要什么种类的水果，水果工厂将我们需要的水果制造出来给我们就可以了。这样我们就无需知道苹果、梨子是怎么种出来的，只用和水果工厂打交道即可。

```java
public abstract class Fruit {
    public abstract void eat();
}

public class Apple extends Fruit{
    @Override
    public void eat() {
        System.out.println("I am apple");
    }
}

public class Pear extends Fruit {
    @Override
    public void eat() {
        System.out.println("I am Pear");
    }
}

public class FruitFactory {

    public Fruit create(String type) {
        switch (type) {
            case "Apple":
                return new Apple();
            case "Pear":
                return new Pear();
            default:
                throw new IllegalArgumentException("暂时没有这种水果");
        }
    }
}
```

调用者类：

```java
public class User {
    private void eat(){
        AppleFactory appleFactory = new FruitFactory();
        Fruit apple = appleFactory.create("Apple");
    }
}
```

如果需要新增一个水果，需要修改代码如下：

```java
public class Orange extends Fruit {
    @Override
    public void eat() {
        System.out.println("I am Orange");
    }
}
public class FruitFactory {

    public Fruit create(String type) {
        switch (type) {
            case "Apple":
                return new Apple();
            case "Pear":
                return new Pear();
            //新增一种水果
            case "Orange":
                return new Orange();
            default:
                throw new IllegalArgumentException("暂时没有这种水果");
        }
    }
}
```

- 如果需要生产的产品过多，此模式会导致工厂类过于庞大，承担过多的职责，变成超级类。当苹果生产过程需要修改时，要来修改此工厂。梨子生产过程需要修改时，也要来修改此工厂。也就是说这个类不止一个引起修改的原因。违背了单一职责原则。
- 当要生产新的产品时，必须在工厂类中添加新的分支。而开闭原则告诉我们：类应该对修改封闭。我们希望在添加新功能时，只需增加新的类，而不是修改既有的类，所以这就违背了开闭原则。

#### 工厂模式

为了解决简单工厂模式的这两个弊端，工厂方法模式应运而生，它规定每个产品都有一个专属工厂，。比如苹果有专属的苹果工厂，梨子有专属的梨子工厂

```java
public class AppleFactory {
    public Fruit create(){
    	return new Apple();
    }
}
public class PearFactory {
    public Fruit create(){
    	return new Pear();
    }
}
```

调用者类：

```java
public class User {
    private void eat(){
        AppleFactory appleFactory = new AppleFactory();
        Fruit apple = appleFactory.create();
    }
}
```

新增水果：

```java
//当我们需要新增一个水果时，需新增一个相对应的工厂
public class OrangeFactory {
    public Fruit create(){
    	return new Orange();
    }
}
```



- 当生产的产品种类越来越多时，工厂类不会变成超级类。工厂类会越来越多，保持灵活。不会越来越大、变得臃肿。如果苹果的生产过程需要修改时，只需修改苹果工厂。梨子的生产过程需要修改时，只需修改梨子工厂。符合单一职责原则。
- 当需要生产新的产品时，无需更改既有的工厂，只需要添加新的工厂即可。保持了面向对象的可扩展性，符合开闭原则。
- 需要知道有哪些工厂（对工厂产生依赖）

### 03 抽象工厂模式

工厂方法模式可以进一步优化，提取出工厂接口：

```java
public interface IFactory {
	Fruit create();
}
```

`AppleFactory`为：

```java
public class AppleFactory implents IFactory{
    public Fruit create(){
    	return new Apple();
    }
}
```

调用者类

```java
public class User {
    private void eat(){
        IFactory appleFactory = new AppleFactory();//替换工厂时只需改这一行代码
        Fruit apple = appleFactory.create();
    }
}
```

调用者可以将 AppleFactory 和 PearFactory 统一作为 IFactory 对象使用

我们在创建时指定了具体的工厂类后，在使用时就无需再关心是哪个工厂类，只需要将此工厂当作抽象的 IFactory 接口使用即可。

客户端只和 IFactory 打交道了，调用的是接口中的方法，使用时根本不需要知道是在哪个具体工厂中实现的这些方法，这就使得替换工厂变得非常容易。

缺点是抽象工厂模式太重了，如果IFactory 接口需要新增功能，则会影响到所有的具体工厂类。**抽象工厂模式适用于增加同类工厂这样的横向扩展需求，不适合新增功能这样的纵向扩展。**



**简单工厂 ： 用来生产同一等级结构中的任意产品。（不支持拓展增加产品）**

**工厂方法 ：用来生产同一等级结构中的固定产品。（支持拓展增加产品）**  

**抽象工厂 ：用来生产不同产品族的全部产品。（支持拓展增加产品；支持增加产品族）**



### 04 建造者模式

假设我们有一个对象需要建立，这个对象是由多个组件（Component）组合而成，每个组件的建立都比较复杂，但运用组件来建立所需的对象非常简单，所以我们就可以将构建复杂组件的步骤与运用组件构建对象分离，使用builder模式可以建立。

建造型模式用于创建过程稳定，但配置多变的对象，使用多个简单的对象一步一步构建成一个复杂的对象。

现在建造者模式主要用来通过链式调用生成不同的配置，比如我们要制作一杯珍珠奶茶。它的制作过程是稳定的，除了必须要知道奶茶的种类和规格外，是否加珍珠和是否加冰是可选的。使用建造者模式表示如下：

```java
public class MilkTea {

    private  String type;

    private String size;

    private boolean pearl;

    private boolean ice;

    public MilkTea(Builder builder) {
        this.type = builder.getType();
        this.size = builder.getSize();
        this.pearl = builder.getPearl();
        this.ice = builder.getIce();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public boolean isPearl() {
        return pearl;
    }

    public void setPearl(boolean pearl) {
        this.pearl = pearl;
    }

    public boolean isIce() {
        return ice;
    }

    public void setIce(boolean ice) {
        this.ice = ice;
    }

    @Override
    public String toString() {
        return "MilkTea{" +
                "type='" + type + '\'' +
                ", size='" + size + '\'' +
                ", pearl=" + pearl +
                ", ice=" + ice +
                '}';
    }

    public static class Builder{

        private  String type = "原味";

        private String size = "中杯";

        private boolean pearl;

        private boolean ice;


        public Builder setType(String type) {
            this.type = type;
            return this;
        }

        public Builder setSize(String size) {
            this.size = size;
            return this;
        }

        public Builder setPearl(boolean pearl) {
            this.pearl = pearl;
            return this;
        }

        public Builder setIce(boolean ice) {
            this.ice = ice;
            return this;
        }

        public String getType() {
            return type;
        }

        public String getSize() {
            return size;
        }

        public boolean getPearl() {
            return pearl;
        }

        public boolean getIce() {
            return ice;
        }

        public MilkTea build(){
            return new MilkTea(this);
        }
    }

    public static void main(String[] args) {
        MilkTea milkTea = new Builder().setType("111").setSize("大杯").build();
        System.out.println(milkTea.toString());
    }

}
```



### 05 原型模式

原型模式：**用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。**

#### 浅拷贝

对基本数据类型进行值传递，对引用数据类型进行引用传递般的拷贝

需要实现Cloneable 接口

Object 的 clone() 方法

#### 深拷贝

对基本数据类型进行值传递，对引用数据类型创建一个新的对象，并复制内容

```java
public class ProtoType {

    public static void main(String[] args) throws CloneNotSupportedException {
        Person person1 = new Person(new Man("John"), 10);
        Person person2 = person1.clone();

        System.out.println("parent1 = " + person1.toString());
        System.out.println("parent2 = " + person2.toString());

        person2.setAge(100);
        person2.setManName("abc");

        System.out.println("parent1 = " + person1.toString());
        System.out.println("parent2 = " + person2.toString());

    }

    public static class Person implements Cloneable{

        Man man;
        int age = 0;

        public Person(Man man, int age) {
            this.man = man;
            this.age = age;
        }

        public void setManName(String manName) {
            this.man.setName(manName);
        }

        public void setAge(int age) {
            this.age = age;
        }

        @Override
        protected Person clone() throws CloneNotSupportedException {
            return (Person) super.clone();
        }

        @Override
        public String toString() {
            return "Parent{" +
                    "name='" + man.getName() + '\'' +
                    ", age=" + age +
                    '}';
        }
    }

    public static class Man{
        private String name;

        public Man(String name) {
            this.name = name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }

    }
}

输入结果：
parent1 = Parent{name='John', age=10}
parent2 = Parent{name='John', age=10}
parent1 = Parent{name='abc', age=10}
parent2 = Parent{name='abc', age=100}
```



## 结构型

### 06 代理模式

由于某些原因需要给某对象提供一个代理以控制对该对象的访问。这时，访问对象不适合或者不能直接引用目标对象，代理对象作为访问对象和目标对象之间的中介

代理模式的主要**优点**有：

- 代理模式在客户端与目标对象之间起到一个中介作用和保护目标对象的作用；
- 代理对象可以扩展目标对象的功能；
- 代理模式能将客户端与目标对象分离，在一定程度上降低了系统的耦合度；

其主要**缺点**是：

- 在客户端和目标对象之间增加一个代理对象，会造成请求处理速度变慢；
- 增加了系统的复杂度；

#### 静态代理

```java
public interface Subject{
    void operate();
}
public class RealSubject implements Subject{
    @Override
    public void operate()
    {
        System.out.println("RealSubject");
    }
}
public class Proxy implements Subject
{
    private Subject subject = null;

    @Override
    public void operate()
    {
        if(subject == null){
            subject = new RealSubject();
        }
        System.out.print("I'm Proxy, I'm invoking...");
        this.subject.operate();
    }
}
//测试代码：

Subject subject = new Proxy();
subject.operate();
输出：I’m Proxy, I’m invoking…RealSubject
```

#### 动态代理

动态代理是指在运行时，动态生成代理类，即，代理类的字节码将在运行时生成并载入当前的ClassLoader

与静态代理类想比，动态类有诸多好处：

- 首先，不需要为真实主题(RealSubject)写一个形式上完全一样的封装类，假如主题接口中的方法很多，为每一个接口写一个代理方法也是非常烦人的事，如果接口有变动，则真实主题和代理类都要修改，不利于系统维护；
- 其次，使用一些动态代理的生成方法甚至可以在运行时指定代理类的执行逻辑，从而大大提升系统的灵活性。

**JDK动态代理例子**

```java
/*
 * 修改代理类
 */
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class ProxyHandler implements InvocationHandler{
    Object obj = null;

    public Object newProxyInstance(Object realObj){
        this.obj = realObj;
        Class<?> classType = realObj.getClass();
        return Proxy.newProxyInstance(classType.getClassLoader(), classType.getInterfaces(), this);
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable
    {
        System.out.print("I'm Proxy, I'm invoking...");
        method.invoke(obj, args);
        System.out.println("invoke end!");
        return null;
    }
}

//测试代码

Subject subject = (Subject) new ProxyHandler().newProxyInstance(new RealSubject());
subject.operate();

//输出结果
I'm Proxy, I'm invoking...RealSubject
invoke end!
```

动态代理模式通过使用反射，可以在运行期决定加载哪个类，避免了一个类对应一个代理的问题；同时，通过统一的invoke方法，统一了代理类对原函数的处理过程，使用动态代理很大程度上减少了重复的代码，降低了维护的复杂性和成本。

### 07 适配器模式

将一个类的接口转换成客户希望的另外一个接口，使得原本由于接口不兼容而不能一起工作的那些类能一起工作

主要优点如下。

- 客户端通过适配器可以透明地调用目标接口。
- 复用了现存的类，程序员不需要修改原有代码而重用现有的适配者类。
- 将目标类和适配者类解耦，解决了目标类和适配者类接口不一致的问题。


其缺点是：对类适配器来说，更换适配器的实现过程比较复杂。

适配器模式可分为对象适配器和类适配器两种，在**对象适配器模式**中，适配器与适配者之间是**关联**关系；在**类适配器模式**中，适配器与适配者之间是**继承**（或实现）关系

#### 类适配器

```java
//被适配者
public class Adaptee {
    public void adapteeRequest() {
        System.out.println("被适配者的方法");
    }
}

//目标对象
public interface Target {
    void request();
}

//怎么才可以在目标接口中的 request() 调用 Adaptee 的 adapteeRequest() 方法呢？
//如果直接实现 Target 是不行的
public class ConcreteTarget implements Target {
    @Override
    public void request() {
        System.out.println("concreteTarget目标方法");
    }
}

//如果通过一个适配器类，实现 Target 接口，同时继承了 Adaptee 类，然后在实现的 request() 方法中调用父类的 adapteeRequest() 即可实现

public class Adapter extends Adaptee implements Target{
    @Override
    public void request() {
        //...一些操作...
        super.adapteeRequest();
        //...一些操作...
    }
}

// 测试方法
public class Test {
    public static void main(String[] args) {
        Target target = new ConcreteTarget();
        target.request();

        Target adapterTarget = new Adapter();
        adapterTarget.request();
    }
}
//输出
concreteTarget目标方法
被适配者的方法
```

![](./images/类适配器.jpg)

#### 对象适配器

对象适配器与类适配器不同之处在于，类适配器通过继承来完成适配，对象适配器则是通过关联来完成，这里稍微修改一下 `Adapter` 类即可将转变为对象适配器

```java
public class Adapter implements Target{
    // 适配者是对象适配器的一个属性
    private Adaptee adaptee = new Adaptee();

    @Override
    public void request() {
        //...
        adaptee.adapteeRequest();
        //...
    }
}
```

![](./images/对象适配器.jpg)

### 08 装饰器模式

允许向一个现有的对象添加新的功能，同时又不改变其结构

装饰（Decorator）模式的定义：指在不改变现有对象结构的情况下，动态地给该对象增加一些职责（即增加其额外功能）的模式

装饰（Decorator）模式的主要优点有：

- 采用装饰模式扩展对象的功能比采用继承方式更加灵活。
- 可以设计出多个不同的具体装饰类，创造出多个不同行为的组合。

其主要缺点是：装饰模式增加了许多子类，如果过度使用会使程序变得很复杂。

```java
//苹果接口
public interface Apple {

    /**
     * 描述
     */
    void res();
}

//苹果实现
public class ConcreteApple implements Apple {
    @Override
    public void res() {
        System.out.println("普通的苹果");
    }
}

//装饰器基类
public abstract class Decorator implements Apple {

    protected Apple apple;

    public Decorator(Apple apple) {
        super();
        this.apple = apple;
    }
    @Override
    public void res() {
        apple.res();
    }
    
}

//装饰器A
public class ConcreteDecoratorA extends Decorator{

    public ConcreteDecoratorA(Apple apple) {
        super(apple);
    }
    
    public void resA(){
        System.out.println("被装饰器A扩展的功能");
    }

    @Override
    public void res(){
        System.out.println("装饰器A=>装饰成红色的");
        super.res();
        System.out.println("装饰器A=>装饰结束");
    }
}

//装饰器B
public class ConcreteDecoratorB extends Decorator{

    public ConcreteDecoratorB(Apple apple) {
        super(apple);
    }
    
    public void resB(){
        System.out.println("被装饰器B扩展的功能");
    }

    @Override
    public void res(){
        System.out.println("装饰器B=>装饰成绿色的");
        super.res();
        System.out.println("装饰器B=>装饰结束");
    }
}
```

装饰模式在 [Java](http://c.biancheng.net/java/) 语言中的最著名的应用莫过于 Java I/O 标准库的设计了。例如，`InputStream `的子类 `FilterInputStream`，`OutputStream` 的子类 `FilterOutputStream`，`Reader` 的子类` BufferedReader` 以及 `FilterReader`，还有 Writer 的子类 `BufferedWriter`、`FilterWriter` 以及` PrintWriter `等，它们都是抽象装饰类。

下面代码是为` FileReader` 增加缓冲区而采用的装饰类 `BufferedReader` 的例子：

```java
import java.io.*;

public class ZhuangShiQi {
    public static void main(String[] args) throws IOException {
        File file = new File("test1.txt");
        FileReader fileReader = new FileReader(file);
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        //只能读取一个character
        System.out.println(fileReader.read());
        //只能读取一个character
        System.out.println(bufferedReader.read());
        
        //可以读取一行
        System.out.println(bufferedReader.readLine());

    }
}
```

Java 的IO类即是使用的装饰器模式，`BufferedReader`在`FileReader`上增加了新的功能`readLine()`

### 09 享元模式

运用共享技术来有效地支持大量细粒度对象的复用。它通过共享已经存在的对象来大幅度减少需要创建的对象数量、避免大量相似类的开销，从而提高系统资源的利用率。

享元模式的主要优点是：相同对象只要保存一份，这降低了系统中对象的数量，从而降低了系统中细粒度对象给内存带来的压力。

```java
//图形接口
public interface Shape {
   void draw();
}

//图形类 实现
public class Circle implements Shape {
   private String color;
   private int x;
   private int y;
   private int radius;
 
   public Circle(String color){
      this.color = color;     
   }
 
   public void setX(int x) {
      this.x = x;
   }
 
   public void setY(int y) {
      this.y = y;
   }
 
   public void setRadius(int radius) {
      this.radius = radius;
   }
 
   @Override
   public void draw() {
      System.out.println("Circle: Draw() [Color : " + color 
         +", x : " + x +", y :" + y +", radius :" + radius);
   }
}

//创建一个工厂 缓存  图形
import java.util.HashMap;
 
public class ShapeFactory {
   private static final HashMap<String, Shape> circleMap = new HashMap<>();
 
   public static Shape getCircle(String color) {
      Circle circle = (Circle)circleMap.get(color);
 
      if(circle == null) {
         circle = new Circle(color);
         circleMap.put(color, circle);
         System.out.println("Creating circle of color : " + color);
      }
      return circle;
   }
}
```

### 10 组合模式

组合模式对单个对象(叶子对象)和组合对象(组合对象)具有一致性，它将对象组织到树结构中，可以用来描述整体与部分的关系。同时它也模糊了简单元素(叶子对象)和复杂元素(容器对象)的概念，使得客户能够像处理简单元素一样来处理复杂元素，从而使客户程序能够与复杂元素的内部结构解耦。

组合模式的主要优点有：

- 组合模式使得客户端代码可以一致地处理单个对象和组合对象，无须关心自己处理的是单个对象，还是组合对象，这简化了客户端代码；
- 更容易在组合体内加入新的对象，客户端不会因为加入了新的对象而更改源代码，满足“开闭原则”；


其主要缺点是：

- 使设计变得更加抽象，对象的业务规则如果很复杂，则实现组合模式具有很大挑战性，而且不是所有的方法都与叶子对象子类都有关联

组合模式适用场景：

- 需要表示一个对象整体或部分层次，在具有整体和部分的层次结构中，希望通过一种方式忽略整体与部分的差异，可以一致地对待它们。
- 让客户能够忽略不同对象层次的变化，客户端可以针对抽象构件编程，无须关心对象层次结构的细节。

```java
//定义文件抽象类
public abstract class File {
    String name;
    
    public File(String name){
        this.name = name;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public abstract void display();
}

//文件夹类：Folder.java，该类包含对文件的增加、删除和浏览三个方法
public class Folder extends File{
    private List<File> files;
    
    public Folder(String name){
        super(name);
        files = new ArrayList<File>();
    }
    
    /**
     * 浏览文件夹中的文件
     */
    public void display() {
        for(File file : files){
            file.display();
        }
    }
    
    /**
     * @desc 向文件夹中添加文件
     * @param file
     * @return void
     */
    public void add(File file){
        files.add(file);
    }
    
    /**
     * @desc 从文件夹中删除文件
     * @param file
     * @return void
     */
    public void remove(File file){
        files.remove(file);
    }
}

//然后是三个文件类：TextFile.java、ImageFile.java、VideoFile.java
public class TextFile extends File{

    public TextFile(String name) {
        super(name);
    }

    public void display() {
        System.out.println("这是文本文件，文件名：" + super.getName());
    }
    
}

public class ImagerFile extends File{

    public ImagerFile(String name) {
        super(name);
    }

    public void display() {
        System.out.println("这是图像文件，文件名：" + super.getName());
    }

}

public class VideoFile extends File{

    public VideoFile(String name) {
        super(name);
    }

    public void display() {
        System.out.println("这是影像文件，文件名：" + super.getName());
    }

}

//测试类
public class Client {
    public static void main(String[] args) {
        //总文件夹
        Folder zwjj = new Folder("总文件夹");
        //向总文件夹中放入三个文件：a.txt、b.jpg、c文件夹
        TextFile aText= new TextFile("a.txt");
        ImagerFile bImager = new ImagerFile("b.jpg");
        Folder cFolder = new Folder("C文件夹");
        
        zwjj.add(aText);
        zwjj.add(bImager);
        zwjj.add(cFolder);
        
        //向C文件夹中添加文件：c_1.txt、c_1.rmvb、c_1.jpg 
        TextFile cText = new TextFile("c_1.txt");
        ImagerFile cImage = new ImagerFile("c_1.jpg");
        VideoFile cVideo = new VideoFile("c_1.rmvb");
        
        cFolder.add(cText);
        cFolder.add(cImage);
        cFolder.add(cVideo);
        
        //遍历C文件夹
        cFolder.display();
        //将c_1.txt删除
        cFolder.remove(cText);
        System.out.println("-----------------------");
        cFolder.display();
    }
}
```

### 11 桥接模式

将抽象与实现分离，使它们可以独立变化。它是用组合关系代替继承关系来实现，从而降低了抽象和实现这两个可变维度的耦合度。

桥接（Bridge）模式的优点是：

- 由于抽象与实现分离，所以扩展能力强；
- 其实现细节对客户透明。

缺点是：由于聚合关系建立在抽象层，要求开发者针对抽象化进行设计与编程，这增加了系统的理解与设计难度。

符合合成/聚合原则

继承虽然是面向对象的三大特性之一，但继承会导致子类与父类有非常紧密的依赖关系，它会限制子类的灵活性和子类的复用性。而使用合成 / 聚合，也就是使用接口实现的方式，就不存在依赖问题，一个类可以实现多个接口，可以很方便地拓展功能。

**例子**

女士包按用途分可分为钱包（Wallet）和挎包（HandBag），按颜色分可选黄色（Yellow）和红色（Red）

如果采用继承的方式实现，需要2*2个类 ，如果包的种类需要扩展一个，则需要新增2个类

如果采用桥接模式实现，需要2 + 2 个类， 如果包的种类扩展一个，则需要新增1个类

下面是桥接模式实现

```java
//颜色接口
interface Color
{
    String getColor();
}
//黄色
class Yellow implements Color
{
    public String getColor()
    {
        return "yellow";
    }
}
//红色
class Red implements Color
{
    public String getColor()
    {
        return "red";
    }
}
//抽象包
abstract class Bag{
    //桥接颜色类
    protected Color color;
    public void setColor(Color color)
    {
        this.color=color;
    }   
    public abstract String getName();
}
//挎包
class HandBag extends Bag{
    public String getName()
    {
        return color.getColor()+"HandBag";
    }   
}
//钱包
class Wallet extends Bag{
    public String getName()
    {
        return color.getColor()+"Wallet";
    }   
}
//测试
HandBag handBag = new HandBag();
handBag.setColor(new Yellow);
System.out.println(handBag.getName()); //输出： yellowHandBag

HandBag handBag = new HandBag();
handBag.setColor(new Red);
System.out.println(handBag.getName()); //输出： redHandBag
```

### 12 外观模式

外观（Facade）模式是一种通过为多个复杂的子系统提供一个一致的接口，而使这些子系统更加容易被访问的模式。该模式对外有一个统一接口，外部应用程序不用关心内部子系统的具体的细节，这样会大大降低应用程序的复杂度，提高了程序的可维护性。

外观模式是“迪米特法则”的典型应用，它有以下主要优点。

- 降低了子系统与客户端之间的耦合度，使得子系统的变化不会影响调用它的客户类。
- 对客户屏蔽了子系统组件，减少了客户处理的对象数目，并使得子系统使用起来更加容易。
- 降低了大型软件系统中的编译依赖性，简化了系统在不同平台之间的移植过程，因为编译一个子系统不会影响其他的子系统，也不会影响外观对象。


外观模式的主要缺点如下。

- 增加新的子系统可能需要修改外观类或客户端的源代码，违背了“开闭原则”。

外观模式非常简单，体现的就是 Java 中封装的思想。将多个子系统封装起来，提供一个更简洁的接口供外部调用。

![](./images/外观模式.jpg)

>  外部与一个子系统的通信必须通过一个统一的外观对象进行，为子系统中的一组接口提供一个一致的界面，外观模式定义了一个高层接口，这个接口使得这一子系统更加容易使用。外观模式又称为门面模式。

**例子**

上班需要做的事：

- 签到
- 打开浏览器 查看邮箱
- 打开IDEA

下班需要做的事：

- 关闭IDEA
- 关闭浏览器 
- 签退

使用外观模式将上下班做的事封装成一个方法

```java
//打卡
public class Sign{

    public void signIn{
        System.out.println("我在签到");
    }
    
    public void signOut{
        System.out.println("我在签退");
    }
}
//浏览器
public class Browser{

    public void open{
        System.out.println("我在打开浏览器");
    }
    
    public void close{
        System.out.println("我在关闭浏览器");
    }
}

// IDEA
public class Idea{

    public void open{
        System.out.println("我在打开Idea去搬转了");
    }
    
    public void close{
        System.out.println("我在关闭Idea");
    }
}

//外观模式
public class Facade{
    
    Sign sign = new Sign();
    Browser browser = new Browser();
    Idea idea = new Idea();

    public void work{
        sign.signIn();
        browser.open();
        idea.open();
    }
    
    public void goHome{
        sign.signOut();
        browser.close();
        idea.close();
    }
}

//测试
//上班的行为
Sign sign = new Sign();
sign.signIn();
Browser browser = new Browser();
browser.open();
Idea idea = new Idea();
idea.open();

//使用外观模式
Facade facede = new Facade();
facede.work();
```

由于我们每天都要做这几件事，所以我们可以使用**外观模式**，将这几个子系统封装起来，提供更简洁的接口

外观模式使得两种不同的类不用直接交互，而是通过一个中间件——也就是外观类——间接交互。外观类中只需要暴露简洁的接口，隐藏内部的细节，所以说白了就是封装的思想。

## 行为型

### 13 模板方法模式

定义一个操作中算法的骨架，而将一些步骤延迟到子类中，模板方法使得子类可以不改变算法的结构即可重定义该算法的某些特定步骤。

通俗点的理解就是 ：完成一件事情，有固定的数个步骤，但是每个步骤根据对象的不同，而实现细节不同；就可以在父类中定义一个完成该事情的总方法，按照完成事件需要的步骤去调用其每个步骤的实现方法。每个步骤的具体实现，由子类完成。

该模式的主要优点如下：

- 它封装了不变部分，扩展可变部分。它把认为是不变部分的算法封装到父类中实现，而把可变部分算法由子类继承实现，便于子类继续扩展。
- 它在父类中提取了公共的部分代码，便于代码复用。
- 部分方法是由子类实现的，因此子类可以通过扩展方式增加相应的功能，符合开闭原则。

该模式的主要缺点如下

- 对每个不同的实现都需要定义一个子类，这会导致类的个数增加，系统更加庞大，设计也更加抽象。

- 父类中的抽象方法由子类实现，子类执行的结果会影响父类的结果，这导致一种反向的控制结构，它提高了代码阅读的难度。

```java
//定义模板类 负责给出一个算法的轮廓和骨架。它由一个模板方法和若干个基本方法构成。
public abstract class Game {
 
   //模板
   public final void play(){
 
      //初始化游戏
      initialize();
 
      //开始游戏
      startPlay();
 
      //结束游戏
      endPlay();
   }
   abstract void initialize();
   abstract void startPlay();
   abstract void endPlay();
}

//实现类1
public class Cricket extends Game {
 
   @Override
   void endPlay() {
      System.out.println("Cricket Game Finished!");
   }
 
   @Override
   void initialize() {
      System.out.println("Cricket Game Initialized! Start playing.");
   }
 
   @Override
   void startPlay() {
      System.out.println("Cricket Game Started. Enjoy the game!");
   }
}

//实现类2
public class Football extends Game {
 
   @Override
   void endPlay() {
      System.out.println("Football Game Finished!");
   }
 
   @Override
   void initialize() {
      System.out.println("Football Game Initialized! Start playing.");
   }
 
   @Override
   void startPlay() {
      System.out.println("Football Game Started. Enjoy the game!");
   }
}

//测试类
public class TemplatePatternDemo {
   public static void main(String[] args) {
 
      Game game = new Cricket();
      game.play();
      System.out.println();
      game = new Football();
      game.play();      
   }
}
//输出：
Cricket Game Initialized! Start playing.
Cricket Game Started. Enjoy the game!
Cricket Game Finished!

Football Game Initialized! Start playing.
Football Game Started. Enjoy the game!
Football Game Finished!
```

### 14 策略模式

该模式定义了一系列算法，并将每个算法封装起来，使它们可以相互替换，且算法的变化不会影响使用算法的客户。策略模式属于对象行为模式，它通过对算法进行封装，把使用算法的责任和算法的实现分割开来，并委派给不同的对象对这些算法进行管理。

**意图：**定义一系列的算法,把它们一个个封装起来, 并且使它们可相互替换。

**主要解决：**在有多种算法相似的情况下，使用 if...else 所带来的复杂和难以维护。

**优点：** 1、算法可以自由切换。 2、避免使用多重条件判断。 3、扩展性良好。

**缺点：** 1、策略类会增多。 2、所有策略类都需要对外暴露。

策略模式往往和简单工厂方法结合，下面是一个例子：

```java
//策略接口
public interface Strategy {
	public int calc(int num1,int num2);
}
//加法策略
public class AddStrategy implements Strategy {
 
	@Override
	public int calc(int num1, int num2) {
		// TODO Auto-generated method stub
		return num1 + num2;
	}
 
}
//减法策略
public class SubstractStrategy implements Strategy {
 
	@Override
	public int calc(int num1, int num2) {
		// TODO Auto-generated method stub
		return num1 - num2;
	}
 
}

//策略工厂
public class StrategyFactory{
    private static Map<String, Strategy> strategyMap;
    static{
        strategyMap = new HashMap<>();
        strategyMap.put("+", new AddStrategy());
        strategyMap.put("+", new SubstractStrategy());
    }
    
    public Strategy getStrategy(String key){
        return strategyMap.get(key);
    }
}

//测试方法
StrategyFactory strategyFactory = new StrategyFactory();
Strategy strategy = strategyFactory.getStrategy("+");
System.out.println("1 + 3 = " + strategy.calc(1, 3));

//输出
1 + 3 = 4
```

### 15 观察者模式

指多个对象间存在一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都得到通知并被自动更新。这种模式有时又称作发布-订阅模式、模型-视图模式，它是对象行为型模式。

**主要解决：**一个对象状态改变给其他对象通知的问题，而且要考虑到易用和低耦合，保证高度的协作。

**何时使用：**一个对象（目标对象）的状态发生改变，所有的依赖对象（观察者对象）都将得到通知，进行广播通知。

**优点：** 

- 观察者和被观察者是抽象耦合的
- 建立一套触发机制。

**缺点：** 

- 如果一个被观察者对象有很多的直接和间接的观察者的话，将所有的观察者都通知到会花费很多时间
- 如果在观察者和观察目标之间有循环依赖的话，观察目标会触发它们之间进行循环调用，可能导致系统崩溃
- 观察者模式没有相应的机制让观察者知道所观察的目标对象是怎么发生变化的，而仅仅只是知道观察目标发生了变化。

```java
// 定义一个  被观察者接口
public interface Subject {
	  public void registerObserver(Observer o);
	  public void removeObserver(Observer o);
	  public void notifyObserver();

}
// 定义一个  观察者接口
public interface Observer {
	public void update(String message);
}

// 定义被观察者，实现了Subject接口，对Subject接口的三个方法进行了具体实现，同时有一个List集合，用以保存注册的观察者，等需要通知观察者时，遍历该集合即可。
public class WechatServer implements Subject {
 
	private List<Observer> list;
	private String message;
 
	public WechatServer() {
		list = new ArrayList<Observer>();
	}
    
	@Override
	public void registerObserver(Observer o) {
		// TODO Auto-generated method stub
		list.add(o);
	}
	@Override
	public void removeObserver(Observer o) {
		// TODO Auto-generated method stub
		if (!list.isEmpty()) {
			list.remove(o);
		}
	}
	@Override
	public void notifyObserver() {
		// TODO Auto-generated method stub
		for (Observer o : list) {
			o.update(message);
		}
	}
	public void setInfomation(String s) {
		this.message = s;
		System.out.println("微信服务更新消息： " + s);
		// 消息更新，通知所有观察者
		notifyObserver();
	}
}
//定义具体观察者 User
public class User implements Observer {
	private String name;
	private String message;

	public User(String name) {
		this.name = name;
	}
 
	@Override
	public void update(String message) {
		this.message = message;
		read();
	}
 
	public void read() {
		System.out.println(name + " 收到推送消息： " + message);
	}
 
}

//测试
public class MainTest {
	 public static void main(String[] args) {
         //被观察者
	     WechatServer server = new WechatServer();
         
         //定义三个观察者
	     Observer userZhang = new User("ZhangSan");
	     Observer userLi = new User("LiSi");
         Observer userWang = new User("WangWu");
	     //观察者注册到 被观察者      
         server.registerObserver(userZhang);
         server.registerObserver(userLi);
         server.registerObserver(userWang);
         server.setInfomation("PHP是世界上最好用的语言！");
         
         System.out.println("----------------------------------------------");
         //被观察者状态改变， 依次通知观察者
         server.setInfomation("JAVA是世界上最好用的语言！");  
     }
}

//输出：
ZhangSan 收到推送消息：PHP是世界上最好用的语言！
LiSi 收到推送消息：PHP是世界上最好用的语言！
WangWu 收到推送消息：PHP是世界上最好用的语言！
----------------------------------------------
ZhangSan 收到推送消息：JAVA是世界上最好用的语言！
LiSi 收到推送消息：JAVA是世界上最好用的语言！
WangWu 收到推送消息：JAVA是世界上最好用的语言！
```

### 16 命令模式

将一个请求封装为一个对象，使发出请求的责任和执行请求的责任分割开。这样两者之间通过命令对象进行沟通，这样方便将命令对象进行储存、传递、调用、增加与管理。

行为请求者与行为实现者通常是一种紧耦合的关系，但某些场合，比如需要对行为进行记录、撤销或重做、事务等处理时，这种无法抵御变化的紧耦合的设计就不太合适。

**优点：** 

- 降低了系统耦合度，命令模式能将调用操作的对象与实现该操作的对象解耦
- 增加或删除命令非常方便。采用命令模式增加与删除命令不会影响其他类，它满足“开闭原则”，对扩展比较灵活。

**缺点：**

- 使用命令模式可能会导致某些系统有过多的具体命令类。

**使用场景：**认为是命令的地方都可以使用命令模式，比如： 1、GUI 中每一个按钮都是一条命令。 2、模拟 CMD。

```java
// 创建一个请求类
public class Stock {
   
   private String name = "ABC";
   private int quantity = 10;
 
   public void buy(){
      System.out.println("Stock [ Name: "+name+", 
         Quantity: " + quantity +" ] bought");
   }
   public void sell(){
      System.out.println("Stock [ Name: "+name+", 
         Quantity: " + quantity +" ] sold");
   }
}
// 创建一个命令接口
public interface Order {
   void execute();
}
// 创建实现了 Order 接口的 命令处理 类（命令实际执行者）
public class BuyStock implements Order {
   private Stock abcStock;
 
   public BuyStock(Stock abcStock){
      this.abcStock = abcStock;
   }
 
   public void execute() {
      abcStock.buy();
   }
}
public class SellStock implements Order {
   private Stock abcStock;
 
   public SellStock(Stock abcStock){
      this.abcStock = abcStock;
   }
 
   public void execute() {
      abcStock.sell();
   }
}
//创建命令类
public class Broker {
   private List<Order> orderList = new ArrayList<Order>(); 
 
   public void takeOrder(Order order){
      orderList.add(order);      
   }
 
   public void placeOrders(){
      for (Order order : orderList) {
         order.execute();
      }
      orderList.clear();
   }
}
//测试类
public class CommandPatternDemo {
   public static void main(String[] args) {
      Stock abcStock = new Stock();
 
      BuyStock buyStockOrder = new BuyStock(abcStock);
      SellStock sellStockOrder = new SellStock(abcStock);
 
      // 接受命令
      Broker broker = new Broker();
      broker.takeOrder(buyStockOrder);
      broker.takeOrder(sellStockOrder);
 
      //执行命令
      broker.placeOrders();
   }
}
//输出
Stock [ Name: ABC, Quantity: 10 ] bought
Stock [ Name: ABC, Quantity: 10 ] sold
```

### 17 责任链模式

为了避免请求发送者与多个请求处理者耦合在一起，将所有请求的处理者通过前一对象记住其下一个对象的引用而连成一条链；当有请求发生时，可将请求沿着这条链传递，直到有对象处理它为止。

**主要解决：**职责链上的处理者负责处理请求，客户只需要将请求发送到职责链上即可，无须关心请求的处理细节和请求的传递，所以职责链将请求的发送者和请求的处理者解耦了。

**优点：** 

- 降低耦合度。它将请求的发送者和接收者解耦
- 简化了对象。使得对象不需要知道链的结构
- 增强给对象指派职责的灵活性。通过改变链内的成员或者调动它们的次序，允许动态地新增或者删除责任
- 增加新的请求处理类很方便。

**缺点：**

- 不能保证请求一定被接收
- 系统性能将受到一定影响，而且在进行代码调试时不太方便，可能会造成循环调用
- 可能不容易观察运行时的特征，有碍于除错。

**使用场景：** 

- 有多个对象可以处理同一个请求，具体哪个对象处理该请求由运行时刻自动确定
- 在不明确指定接收者的情况下，向多个对象中的一个提交一个请求
- 可动态指定一组对象处理请求。

```java
//创建抽象的记录器类。
public abstract class AbstractLogger {
   public static int INFO = 1;
   public static int DEBUG = 2;
   public static int ERROR = 3;
 
   protected int level;
 
   //责任链中的下一个元素
   protected AbstractLogger nextLogger;
 
   public void setNextLogger(AbstractLogger nextLogger){
      this.nextLogger = nextLogger;
   }
 
   public void logMessage(int level, String message){
      if(this.level <= level){
         write(message);
      }
      if(nextLogger !=null){
         nextLogger.logMessage(level, message);
      }
   }
 
   abstract protected void write(String message);
   
}
// 创建扩展了该记录器类的实体类
public class InfoLogger extends AbstractLogger {
 
   public InfoLogger(int level){
      this.level = level;
   }
 
   @Override
   protected void write(String message) {    
      System.out.println("Info::Logger: " + message);
   }
}
public class DebugLogger extends AbstractLogger {
 
   public DebugLogger(int level){
      this.level = level;
   }
 
   @Override
   protected void write(String message) {    
      System.out.println("Debug::Logger: " + message);
   }
}
public class ErrorLogger extends AbstractLogger {
 
   public ErrorLogger(int level){
      this.level = level;
   }
 
   @Override
   protected void write(String message) {    
      System.out.println("Error::Logger: " + message);
   }
}
//测试类
public class ChainPatternDemo {
   
    //定义责任链
   private static AbstractLogger getChainOfLoggers(){
 
      AbstractLogger errorLogger = new ErrorLogger(AbstractLogger.ERROR);
      AbstractLogger debugLogger = new DebugLogger(AbstractLogger.DEBUG);
      AbstractLogger infoLogger = new InfoLogger(AbstractLogger.INFO);
      // 定义的责任链为  errorLogger --> debugLogger -->infoLogger
      errorLogger.setNextLogger(debugLogger);
      debugLogger.setNextLogger(infoLogger);
 
      return errorLogger;  
   }
 
   public static void main(String[] args) {
      AbstractLogger loggerChain = getChainOfLoggers();
 
      loggerChain.logMessage(AbstractLogger.INFO, "This is an information.");
 	  System.out.println();
      loggerChain.logMessage(AbstractLogger.DEBUG, 
         "This is a debug level information.");
      System.out.println();
      loggerChain.logMessage(AbstractLogger.ERROR, 
         "This is an error information.");
   }
}
//输出
Info::Logger: This is an information.

Debug::Logger: This is a debug level information.
Info::Logger: This is a debug level information.

Error::Logger: This is an error information.
Debug::Logger: This is an error information.
Info::Logger: This is an error information.
```

### 18 状态模式

在软件开发过程中，应用程序中的有些对象可能会根据不同的情况做出不同的行为，我们把这种对象称为有状态的对象，而把影响对象行为的一个或多个动态变化的属性称为状态。当有状态的对象与外部事件产生互动时，其内部状态会发生改变，从而使得其行为也随之发生改变。如人的情绪有高兴的时候和伤心的时候，不同的情绪有不同的行为，当然外界也会影响其情绪变化。

对这种有状态的对象编程，传统的解决方案是：将这些所有可能发生的情况全都考虑到，然后使用 if-else 语句来做状态判断，再进行不同情况的处理。但当对象的状态很多时，程序会变得很复杂。而且增加新的状态要添加新的 if-else 语句，这违背了“开闭原则”，不利于程序的扩展。

以上问题如果采用“状态模式”就能很好地得到解决。状态模式的解决思想是：当控制一个对象状态转换的条件表达式过于复杂时，把相关“判断逻辑”提取出来，放到一系列的状态类当中，这样可以把原来复杂的逻辑判断简单化。

**意图：**允许对象在内部状态发生改变时改变它的行为，对象 看起来好像修改了它的类。

**主要解决：**对象的行为依赖于它的状态（属性），并且可以根据它的状态改变而改变它的相关行为。

**优点：** 

- 封装了转换规则
- 枚举可能的状态，在枚举状态之前需要确定状态种类
- 将所有与某个状态有关的行为放到一个类中，并且可以方便地增加新的状态，只需要改变对象状态即可改变对象的行为
- 允许状态转换逻辑与状态对象合成一体，而不是某一个巨大的条件语句块
- 可以让多个环境对象共享一个状态对象，从而减少系统中对象的个数

**缺点：** 

- 状态模式的使用必然会增加系统类和对象的个数
- 状态模式的结构与实现都较为复杂，如果使用不当将导致程序结构和代码的混乱
- 状态模式对"开闭原则"的支持并不太好，对于可以切换状态的状态模式，增加新的状态类需要修改那些负责状态转换的源代码，否则无法切换到新增状态，而且修改某个状态类的行为也需修改对应类的源代码。

**使用场景：** 1、行为随状态改变而改变的场景。 2、条件、分支语句的代替者。

```java
// 创建 Context 类
public class Context {
   private State state;
 
   public Context(){
      state = null;
   }
 
   public void setState(State state){
      this.state = state;     
   }
 
   public State getState(){
      return state;
   }
}

//创建一个接口
public interface State {
   public void doAction(Context context);
}
//创建实体类
public class StartState implements State {
 
   public void doAction(Context context) {
      System.out.println("Player is in start state");
      context.setState(this); 
   }
 
   public String toString(){
      return "Start State";
   }
}
public class StopState implements State {
 
   public void doAction(Context context) {
      System.out.println("Player is in stop state");
      context.setState(this); 
   }
 
   public String toString(){
      return "Stop State";
   }
}

//测试类
public class StatePatternDemo {
   public static void main(String[] args) {
      Context context = new Context();
 
      StartState startState = new StartState();
      startState.doAction(context);
 
      System.out.println(context.getState().toString());
 
      StopState stopState = new StopState();
      stopState.doAction(context);
 
      System.out.println(context.getState().toString());
   }
}

//输出
Player is in start state
Start State
Player is in stop state
Stop State
```



### 19 中介者模式

中介者模式（Mediator Pattern）是用来降低多个对象和类之间的通信复杂性。这种模式提供了一个中介类，该类通常处理不同类之间的通信，并支持松耦合，使代码易于维护。

**意图：**用一个中介对象来封装一系列的对象交互，中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互。

**主要解决：**对象与对象之间存在大量的关联关系，这样势必会导致系统的结构变得很复杂，同时若一个对象发生改变，我们也需要跟踪与之相关联的对象，同时做出相应的处理。

**何时使用：**多个类相互耦合，形成了网状结构。

**应用实例：** 1、中国加入 WTO 之前是各个国家相互贸易，结构复杂，现在是各个国家通过 WTO 来互相贸易。 2、机场调度系统。 3、MVC 框架，其中C（控制器）就是 M（模型）和 V（视图）的中介者。

**优点：** 

- 降低了类的复杂度，将一对多转化成了一对一
- 各个类之间的解耦
- 符合迪米特原则。

**缺点：**

- 中介者会庞大，变得复杂难以维护。

**使用场景：** 

- 系统中对象之间存在比较复杂的引用关系，导致它们之间的依赖关系结构混乱而且难以复用该对象
- 想通过一个中间类来封装多个类中的行为，而又不想生成太多的子类。

**实例：**通过聊天室实例来演示中介者模式。实例中，多个用户可以向聊天室发送消息，聊天室向所有的用户显示消息。我们将创建两个类 `ChatRoom` 和 `User`。`User `对象使用` ChatRoom `方法来分享他们的消息。

演示类`MediatorPatternDemo`，使用 `User` 对象来显示他们之间的通信。

![](./images/中介者.jpg)

```java
//创建中介类
import java.util.Date;
 
public class ChatRoom {
   public static void showMessage(User user, String message){
      System.out.println(new Date().toString()
         + " [" + user.getName() +"] : " + message);
   }
}

//创建user
public class User {
   private String name;
 
   public String getName() {
      return name;
   }
 
   public void setName(String name) {
      this.name = name;
   }
 
   public User(String name){
      this.name  = name;
   }
 
   public void sendMessage(String message){
      ChatRoom.showMessage(this,message);
   }
}

//演示类
public class MediatorPatternDemo {
   public static void main(String[] args) {
      User robert = new User("Robert");
      User john = new User("John");
 
      robert.sendMessage("Hi! John!");
      john.sendMessage("Hello! Robert!");
   }
}

//输出
Thu Jan 31 16:05:46 IST 2013 [Robert] : Hi! John!
Thu Jan 31 16:05:46 IST 2013 [John] : Hello! Robert!
```

### 20 迭代器模式

迭代器（Iterator）模式的定义：提供一个对象来顺序访问聚合对象中的一系列数据，而不暴露聚合对象的内部表示。

**意图：**提供一种方法顺序访问一个聚合对象中各个元素, 而又无须暴露该对象的内部表示。

**主要解决：**不同的方式来遍历整个整合对象。

**何时使用：**遍历一个聚合对象。

其主要优点如下：

- 访问一个聚合对象的内容而无须暴露它的内部表示
- 遍历任务交由迭代器完成，这简化了聚合类
- 它支持以不同方式遍历一个聚合，甚至可以自定义迭代器的子类以支持新的遍历
- 增加新的聚合类和迭代器类都很方便，无须修改原有代码
- 封装性良好，为遍历不同的聚合结构提供一个统一的接口

其主要缺点是

- 增加了类的个数，这在一定程度上增加了系统的复杂性。

```java
//创建接口
public interface Iterator {
   public boolean hasNext();
   public Object next();
}

public interface Container {
   public Iterator getIterator();
}

//创建实现了 Container 接口的实体类。该类有实现了 Iterator 接口的内部类 NameIterator。
public class NameRepository implements Container {
   public String names[] = {"Robert" , "John" ,"Julie" , "Lora"};
 
   @Override
   public Iterator getIterator() {
      return new NameIterator();
   }
 
   private class NameIterator implements Iterator {
 
      int index;
 
      @Override
      public boolean hasNext() {
         if(index < names.length){
            return true;
         }
         return false;
      }
 
      @Override
      public Object next() {
         if(this.hasNext()){
            return names[index++];
         }
         return null;
      }     
   }
}

//使用 NameRepository 来获取迭代器，并打印名字。
public class IteratorPatternDemo {
   
   public static void main(String[] args) {
      NameRepository namesRepository = new NameRepository();
 
      for(Iterator iter = namesRepository.getIterator(); iter.hasNext();){
         String name = (String)iter.next();
         System.out.println("Name : " + name);
      }  
   }
}
```



### 21 访问者模式

在现实生活中，有些集合对象中存在多种不同的元素，且每种元素也存在多种不同的访问者和处理方式。例如，公园中存在多个景点，也存在多个游客，不同的游客对同一个景点的评价可能不同；医院医生开的处方单中包含多种药元素，査看它的划价员和药房工作人员对它的处理方式也不同，划价员根据处方单上面的药品名和数量进行划价，药房工作人员根据处方单的内容进行抓药。

这样的例子还有很多，例如，电影或电视剧中的人物角色，不同的观众对他们的评价也不同；还有顾客在商场购物时放在“购物车”中的商品，顾客主要关心所选商品的性价比，而收银员关心的是商品的价格和数量。

这些被处理的数据元素相对稳定而访问方式多种多样的数据结构，如果用“访问者模式”来处理比较方便。访问者模式能把处理方法从数据结构中分离出来，并可以根据需要增加新的处理方法，且不用修改原来的程序代码与数据结构，这提高了程序的扩展性和灵活性。

访问者（Visitor）模式的定义：将作用于某种数据结构中的各元素的操作分离出来封装成独立的类，使其在不改变数据结构的前提下可以添加作用于这些元素的新的操作，为数据结构中的每个元素提供多种访问方式。它将对数据的操作与数据结构进行分离，是行为类模式中最复杂的一种模式。

**意图：**主要将数据结构与数据操作分离。

**主要解决：**稳定的数据结构和易变的操作耦合问题。

**何时使用：**需要对一个对象结构中的对象进行很多不同的并且不相关的操作，而需要避免让这些操作"污染"这些对象的类，使用访问者模式将这些封装到类中。

**优点：** 

- 符合单一职责原则
- 优秀的扩展性
- 灵活性

**缺点：** 

- 具体元素对访问者公布细节，违反了迪米特原则
- 具体元素变更比较困难
- 违反了依赖倒置原则，依赖了具体类，没有依赖抽象

**例子**

年底，CEO和CTO开始评定员工一年的工作绩效，员工分为工程师和经理，CTO关注工程师的代码量、经理的新产品数量；CEO关注的是工程师的KPI和经理的KPI以及新产品数量。
 由于CEO和CTO对于不同员工的关注点是不一样的，这就需要对不同员工类型进行不同的处理。访问者模式此时可以派上用场了。

```java
// 员工基类  Staff 类定义了员工基本信息及一个 accept 方法，accept 方法表示接受访问者的访问，由子类具体实现。Visitor 是个接口，传入不同的实现类，可访问不同的数据。下面看看工程师和经理的代码：
public abstract class Staff {

    public String name;
    public int kpi;// 员工KPI

    public Staff(String name) {
        this.name = name;
        kpi = new Random().nextInt(10);
    }
    // 核心方法，接受Visitor的访问
    public abstract void accept(Visitor visitor);
}

// 工程师
public class Engineer extends Staff {

    public Engineer(String name) {
        super(name);
    }

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
    // 工程师一年的代码数量
    public int getCodeLines() {
        return new Random().nextInt(10 * 10000);
    }
}

// 经理
public class Manager extends Staff {

    public Manager(String name) {
        super(name);
    }

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
    // 一年做的产品数量
    public int getProducts() {
        return new Random().nextInt(10);
    }
}

//工程师是代码数量，经理是产品数量，他们的职责不一样，也就是因为差异性，才使得访问模式能够发挥它的作用。Staff、Engineer、Manager 3个类型就是对象结构，这些类型相对稳定，不会发生变化。


//然后将这些员工添加到一个业务报表类中，公司高层可以通过该报表类的 showReport 方法查看所有员工的业绩，具体代码如下：
// 员工业务报表类
public class BusinessReport {

    private List<Staff> mStaffs = new LinkedList<>();

    public BusinessReport() {
        mStaffs.add(new Manager("经理-A"));
        mStaffs.add(new Engineer("工程师-A"));
        mStaffs.add(new Engineer("工程师-B"));
        mStaffs.add(new Engineer("工程师-C"));
        mStaffs.add(new Manager("经理-B"));
        mStaffs.add(new Engineer("工程师-D"));
    }

    /**
     * 为访问者展示报表
     * @param visitor 公司高层，如CEO、CTO
     */
    public void showReport(Visitor visitor) {
        for (Staff staff : mStaffs) {
            staff.accept(visitor);
        }
    }
}

// 定义了一个 Visitor 接口，该接口有两个 visit 函数，参数分别是 Engineer、Manager，也就是说对于 Engineer、Manager 的访问会调用两个不同的方法，以此达成区别对待、差异化处理。具体实现类为 CEOVisitor、CTOVisitor类，具体代码如下：

public interface Visitor {

    // 访问工程师类型
    void visit(Engineer engineer);

    // 访问经理类型
    void visit(Manager manager);
}
// CEO访问者
public class CEOVisitor implements Visitor {
    @Override
    public void visit(Engineer engineer) {
        System.out.println("工程师: " + engineer.name + ", KPI: " + engineer.kpi);
    }

    @Override
    public void visit(Manager manager) {
        System.out.println("经理: " + manager.name + ", KPI: " + manager.kpi +
                ", 新产品数量: " + manager.getProducts());
    }
}

//CTO访问者
public class CTOVisitor implements Visitor {
    @Override
    public void visit(Engineer engineer) {
        System.out.println("工程师: " + engineer.name + ", 代码行数: " + engineer.getCodeLines());
    }

    @Override
    public void visit(Manager manager) {
        System.out.println("经理: " + manager.name + ", 产品数量: " + manager.getProducts());
    }
}

//在CEO的访问者中，CEO关注工程师的 KPI，经理的 KPI 和新产品数量，通过两个 visitor 方法分别进行处理。如果不使用 Visitor 模式，只通过一个 visit 方法进行处理，那么就需要在这个 visit 方法中进行判断，然后分别处理，代码大致如下：

public class ReportUtil {
    public void visit(Staff staff) {
        if (staff instanceof Manager) {
            Manager manager = (Manager) staff;
            System.out.println("经理: " + manager.name + ", KPI: " + manager.kpi +
                    ", 新产品数量: " + manager.getProducts());
        } else if (staff instanceof Engineer) {
            Engineer engineer = (Engineer) staff;
            System.out.println("工程师: " + engineer.name + ", KPI: " + engineer.kpi);
        }
    }
}

//这就导致了 if-else 逻辑的嵌套以及类型的强制转换，难以扩展和维护，当类型较多时，这个 ReportUtil 就会很复杂。使用 Visitor 模式，通过同一个函数对不同对元素类型进行相应对处理，使结构更加清晰、灵活性更高。

//测试代码
public class Client {

    public static void main(String[] args) {
        // 构建报表
        BusinessReport report = new BusinessReport();
        System.out.println("=========== CEO看报表 ===========");
        report.showReport(new CEOVisitor());
        System.out.println("=========== CTO看报表 ===========");
        report.showReport(new CTOVisitor());
    }
}
//输出
=========== CEO看报表 ===========
经理: 经理-A, KPI: 9, 新产品数量: 0
工程师: 工程师-A, KPI: 6
工程师: 工程师-B, KPI: 6
工程师: 工程师-C, KPI: 8
经理: 经理-B, KPI: 2, 新产品数量: 6
工程师: 工程师-D, KPI: 6
=========== CTO看报表 ===========
经理: 经理-A, 产品数量: 3
工程师: 工程师-A, 代码行数: 62558
工程师: 工程师-B, 代码行数: 92965
工程师: 工程师-C, 代码行数: 58839
经理: 经理-B, 产品数量: 6
工程师: 工程师-D, 代码行数: 53125
```

注：访问者模式参考https://www.jianshu.com/p/1f1049d0a0f4

### 22 备忘录模式

每个人都有犯错误的时候，都希望有种“后悔药”能弥补自己的过失，让自己重新开始，但现实是残酷的。在计算机应用中，客户同样会常常犯错误，能否提供“后悔药”给他们呢？当然是可以的，而且是有必要的。这个功能由“备忘录模式”来实现。

其实很多应用软件都提供了这项功能，如 Word、记事本、Photoshop、Eclipse 等软件在编辑时按 Ctrl+Z 组合键时能撤销当前操作，使文档恢复到之前的状态；还有在 IE 中的后退键、数据库事务管理中的回滚操作、玩游戏时的中间结果存档功能、数据库与操作系统的备份操作、棋类游戏中的悔棋功能等都属于这类。

备忘录模式能记录一个对象的内部状态，当用户后悔时能撤销当前操作，使数据恢复到它原先的状态。

**意图：**在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。

**主要解决：**所谓备忘录模式就是在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。

**何时使用：**很多时候我们总是需要记录一个对象的内部状态，这样做的目的就是为了允许用户取消不确定或者错误的操作，能够恢复到他原先的状态，使得他有"后悔药"可吃。

**优点：** 

- 给用户提供了一种可以恢复状态的机制，可以使用户能够比较方便地回到某个历史的状态
- 实现了信息的封装，使得用户不需要关心状态的保存细节。

**缺点：**

- 消耗资源。如果类的成员变量过多，势必会占用比较大的资源，而且每一次保存都会消耗一定的内存。

**使用场景：** 

- 需要保存/恢复数据的相关状态场景
- 提供一个可回滚的操作。

```java
//备忘录类
public class Memento {
   private String state;
 
   public Memento(String state){
      this.state = state;
   }
 
   public String getState(){
      return state;
   }  
}
// 备忘录列表
public class CareTaker {
   private List<Memento> mementoList = new ArrayList<Memento>();
 
   public void add(Memento state){
      mementoList.add(state);
   }
 
   public Memento get(int index){
      return mementoList.get(index);
   }
}

// 备忘录中要记录的对象
public class Originator {
   private String state;
 
   public void setState(String state){
      this.state = state;
   }
 
   public String getState(){
      return state;
   }
 
   public Memento saveStateToMemento(){
      return new Memento(state);
   }
 
   public void getStateFromMemento(Memento Memento){
      state = Memento.getState();
   }
}

//测试类
public class MementoPatternDemo {
   public static void main(String[] args) {
      Originator originator = new Originator();
      CareTaker careTaker = new CareTaker();
      originator.setState("State #1");
      originator.setState("State #2");
      careTaker.add(originator.saveStateToMemento());
      originator.setState("State #3");
      careTaker.add(originator.saveStateToMemento());
      originator.setState("State #4");
 
      System.out.println("Current State: " + originator.getState());    
      originator.getStateFromMemento(careTaker.get(0));
      System.out.println("First saved State: " + originator.getState());
      originator.getStateFromMemento(careTaker.get(1));
      System.out.println("Second saved State: " + originator.getState());
   }
}

//输出
Current State: State #4
First saved State: State #2
Second saved State: State #3
```

### 23 解释器模式

解释器模式（Interpreter Pattern）提供了评估语言的语法或表达式的方式，它属于行为型模式。这种模式实现了一个表达式接口，该接口解释一个特定的上下文。这种模式被用在 SQL 解析、符号处理引擎等。

**意图：**给定一个语言，定义它的文法表示，并定义一个解释器，这个解释器使用该标识来解释语言中的句子。

**主要解决：**对于一些固定文法构建一个解释句子的解释器。

**何时使用：**如果一种特定类型的问题发生的频率足够高，那么可能就值得将该问题的各个实例表述为一个简单语言中的句子。这样就可以构建一个解释器，该解释器通过解释这些句子来解决该问题。

**优点：** 

- 可扩展性比较好，灵活
- 增加了新的解释表达式的方式
- 易于实现简单文法

**缺点：** 

- 可利用场景比较少
- 对于复杂的文法比较难维护
- 解释器模式会引起类膨胀
- 解释器模式采用递归调用方法

**使用场景：**

- 可以将一个需要解释执行的语言中的句子表示为一个抽象语法树
- 一些重复出现的问题可以用一种简单的语言来进行表达
- 一个简单语法需要解释的场景

```java
//表达式接口
public interface Expression {
   public boolean interpret(String context);
}
// 表达式接口实现类， 如果要解释的表达式context中包含data则解释为true，否则解释为false
public class TerminalExpression implements Expression {
   
   private String data;
 
   public TerminalExpression(String data){
      this.data = data; 
   }
 
   @Override
   public boolean interpret(String context) {
      if(context.contains(data)){
         return true;
      }
      return false;
   }
}

//创建or和and解释器

/**
 * 如果context中 包含 expr1或者expr2则解释为true,否则解释为false
 */
public class OrExpression implements Expression {
   
   private Expression expr1 = null;
   private Expression expr2 = null;
 
   public OrExpression(Expression expr1, Expression expr2) { 
      this.expr1 = expr1;
      this.expr2 = expr2;
   }
 
   @Override
   public boolean interpret(String context) {      
      return expr1.interpret(context) || expr2.interpret(context);
   }
}

/**
 * 如果context中 包含 expr1且包含expr2  则解释为true,否则解释为false
 */
public class AndExpression implements Expression {
    
   private Expression expr1 = null;
   private Expression expr2 = null;
 
   public AndExpression(Expression expr1, Expression expr2) { 
      this.expr1 = expr1;
      this.expr2 = expr2;
   }
 
   @Override
   public boolean interpret(String context) {      
      return expr1.interpret(context) && expr2.interpret(context);
   }
}

//测试类
public class InterpreterPatternDemo {
 
   //规则：Robert 和 John 是男性
   public static Expression getMaleExpression(){
      Expression robert = new TerminalExpression("Robert");
      Expression john = new TerminalExpression("John");
      return new OrExpression(robert, john);    
   }
 
   //规则：Julie 是一个已婚的女性
   public static Expression getMarriedWomanExpression(){
      Expression julie = new TerminalExpression("Julie");
      Expression married = new TerminalExpression("Married");
      return new AndExpression(julie, married);    
   }
 
   public static void main(String[] args) {
      Expression isMale = getMaleExpression();
      Expression isMarriedWoman = getMarriedWomanExpression();
 
      System.out.println("John is male? " + isMale.interpret("John"));
      System.out.println("Julie is a married women? " 
      + isMarriedWoman.interpret("Married Julie"));
   }
}

//输出
John is male? true
Julie is a married women? true
```


