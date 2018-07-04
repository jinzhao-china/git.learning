#Salesforce 开发手册

##(一) 命名约定

1. 代码中的命名杜绝完全不规范的缩写，避免望文不知义。

2. 代码中的命名严禁使用拼音与英文混合的方式，更不允许直接使用中文的方式。

3. 类名使用UpperCamelCase风格，必须遵从驼峰形式。

4. 方法名、参数名、成员变量、局部变量都统一使用lowerCamelCase风格，必须遵从驼峰形式。

5. 常量命名全部大写，单词间用下划线隔开，力求语义表达完整清楚，不要嫌名字长。


6. 工厂Method，新创建的Object对象实例名前加上new或者create作为Prefix



##(二) 常量定义

1. 不允许出现任何魔法值（即未经定义的常量）直接出现在代码中。

2. 不要使用一个常量类维护所有常量，应该按常量功能进行归类，分开维护。

3. long或者Long初始赋值时，必须使用大写的L，不能是小写的l，小写容易跟数字1混淆，造成误解。


##(三) 格式规约

1. 大括号的使用约定。如果是大括号内为空，则简洁地写成{}即可，不需要换行；如果是非空代码块则： 1） 左大括号前不换行。 2） 左大括号后换行。 3） 右大括号前换行。 4） 右大括号后还有else等代码则不换行；表示终止右大括号后必须换行。

````Java
    If  (i > 0) {     
        //do something
    } 
    else if (i == 0) {     
        // do something
     } 
    else { 
        // do something 
    }
````

2. 左括号和后一个字符之间不出现空格；同样，右括号和前一个字符之间也不出现空格。

3. 任何运算符左右必须加一个空格。

4. 单行字符数限不超过 120 个，超出需要换行时 个，超出需要换行时 遵循如下原则： 
* 第二行相对一缩进 4个空格，从第三行开始不再继续缩进参考示例。 
* 运算符与下文一起换行。 
* 方法调用的点符号与下文一起换行。 
* 在多个参数超长，逗号后进行换行。 
* 在括号前不要换行，见反例。

5. 方法参数在定义和传入时，多个参数逗号后边必须加空格。

6. 文字编码使用utf-8，文件的保存形式使用utf-8并且改行code使用LF(Unix)

7. 没有必要增加若干空格来使某一行的字符与上一行的相应字符对齐。

8. 方法体内的执行语句组、变量的定义语句组、不同的业务逻辑之间或者不同的语义之间插入一个空行。相同业务逻辑和语义之间不需要插入空行。

##(三)控制语句

1. 在if/else/for/while/do语句中必须使用大括号，即使只有一行代码

2. 推荐尽量少用else， if-else的方式可以改写成：
```java
    if(condition){
    ...
    return obj;
    }
    // 接着写else的业务逻辑代码;
```



3. 不要在条件判断中执行其它复杂的语句，将复杂逻辑判断的结果赋值给一个有意义的布尔变量名，以提高可读性。

4. 方法中需要进行参数校验的场景： 
    * 调用频次低的方法。 
    * 执行时间开销很大的方法，参数校验时间几乎可以忽略不计，但如果因为参数错误导致中间执行回退，或者错误，那得不偿失。
    * 对外提供的开放接口

5. 方法中不需要参数校验的场景：
    * 可能被循环调用的方法
    * 被声明成private只会被自己代码所调用的方法，如果能够确定调用方法的代码传入参数已经做过检查或者肯定不会有问题，此时可以不校验参数。



##(四)注释规约
1. 类、类属性、类方法的注释使用/**内容*/格式，不得使用//xxx方式。

2. 方法内部单行注释，在被注释语句上方另起一行，使用//注释。方法内部多行注释使用/* */注释，注意与代码对齐。

3. 代码修改的同时，注释也要进行相应的修改，尤其是参数、返回值、异常、核心逻辑等的修改。

4. 好的命名、代码结构是自解释的，注释力求精简准确、表达到位。避免出现注释的一个极端：过多过滥的注释，代码的逻辑一旦修改，修改注释是相当大的负担。

##(五) 经验实践 Best Practise


1. 非构造方法不能使用与当前类相同的名字 Classes should not have non-constructor methods with the same name as the class
2. 测试类至少应有一个assert方法： System.assert()或者assertEquals()或者AssertNotEquals()
3. 测试方法要与业务逻辑分开。测试Case不能依赖于实行用户的Local Profile，数据等。
4. 太多层的分支结构	Deeply nested if..else statements are hard to read
5. 触发器内避免有逻辑	Avoid logic in triggers
6. 不允许在测试类中使用@isTest(seeAllData=true) ，因为在测试中会调出甚至修改数据库中的真实数据 @isTest(seeAllData=true) should not be used in Apex unit tests because it opens up the existing database data for unexpected modification by tests
7. 避免在构造方法和初始方法操作DML avoid making DML operations in Apex class constructor/init method. 
8. 方法要功能唯一
9. 避免在DML查询中使用未检查的变量 Avoid the usage of untrusted / unescaped variables in DML queries.
  ```java
    public void test1(String t1) {
        Database.query('SELECT Id FROM Account' + t1);
    }
```
    
10. Controller在除了非不得已的情况外，必须指定为 "with sharing"
11. SOQL 的Query文作为String作成的时候，使用 String#escapeSingleQuotes 。
12. 在Apex Class中, 不要硬编码Id,Link，可以使用Custom Label 或者 Static 变量
  Never hard code an Id, link etc. in the code directly. Use Custom Labels or static Apex Classes as a mechanism to drive values for a variable. 

13. For loop中请不要进行SOQL、DML的操作， 在Loop循环中向List里add要更新的Object对象， 并且在最后进行DML的执行

14. 变量命名约定
    * Controller类使用Ctrl结尾; 
    * Extension类使用Ext结尾;
    * Trigger类使用Object+Trigger结尾;
    * Batch类使用Batch结尾;
    * Scheduled类使用Scheduled结尾;
    * Web Service使用WS结尾;
    * 帮助类使用Util结尾;
    * List类使用List结尾;
    * Map类使用Map结尾;
    * Set类使用Set结尾;
    * 抽象类命名使用Abstract或Base开头;
    * 异常类命名使用Exception结尾;
    * 测试类命名以它要测试的类的名称开始，以Test结尾;
 15. 在方法的开始位置调用Debug语句，输出参数信息，在方法的返回位置，输出返回值，这样方便以后的调试。
 Methods should have Debug statements in the beginning and at the end or before the return. This should also include Input and Output parameters to help debugging the code
    
 16. 方法中尽量使用try-catch-finally 来捕获可能的异常，对于系统的错误信息，要转化成用户可以理解的信息。
    
 
 
 
##(六) Visualforce Page


##(七) 单元测试 Apex Unit Test

1. 对于判断逻辑，需要覆盖每个分支	In the case of conditional logic (including ternary operators), execute each branch of code logic.
2. 同时使用有效和无效的输入来测试一个方法 Make calls to methods using both valid and invalid inputs.
3. 利用System.Assert方法来验证系统行为是正确的。	Use System.assert methods to prove that code behaves properly.
会对Trigger,要做批量的数据测试，至少101条数据 Exercise bulk trigger functionality—use at least 20 records in your tests

##(八) ChangeSet


##(九) DataLoader
1. Specify the “Time Zone” this make the create/modify time stamp correct in system.


示例

Apex Class Layout

```java



```

方法 Method 

```java
 /*******************************************************************
   Purpose:  Detailed description of the method                                                         
   Parameters: [optional]
   Returns: [optional]
   Throws [Exceptions]: [optional]                                                          
  ********************************************************************/
  public String addUDAC(param1, param2) {
    system.debug(‘Entering <Method Name>: ‘+ <I/P parameters>);     
    …     
    system.debug(‘Exiting <Method Name>: ‘+ <return value if any>);
    return ..;
  }

```

For Loop:
The traditional for loop:
```java
    for (init_stmt; exit_condition; increment_stmt) {
        //code_block
    }
```
The list or set iteration for loop:
```java
    for (TYPE variable : list_or_set) {
        //code_block
    }
```
The SOQL for loop:
```java
    for (TYPE variable : [soql_query]) {
        //code_block
    }
```
OR
```java
    for (List<TYPE> variable_list : [soql_query]) {
        //code_block
    }
```
While Loop:
```java
    while (!done) { 
        doSomething(); 
        done = moreToDo(); 
    }
```

if-else:
```java
    if (condition) { 
        statements; 
    } 
```



```java
    if (condition) { 
        statements; 
    } else { 
        statements; 
    } 
```
```java
    if (condition) {
        statements; 
    } else if (condition) {
        statements;
    } else {
        statements; 
    }
```
