# FGStaticLibTest
An example for how to build &amp; use of staticlib
在对静态库和动态库的概念有了一定的理解之后，需要动手实践来巩固记忆，这篇文章将会很仔细的讲解只做一个**.a**静态库的过程。

1、构建项目-> 选择 “**Cocoa Touch Static Library**”
![2EE05085-6570-4BDB-A629-BA4C2C573595.png](http://upload-images.jianshu.io/upload_images/1155603-3affcad284bbfb0d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2、在一级目录加入目标文件，这里使用我封装的一个**Toast**类做为例子。

![*](http://upload-images.jianshu.io/upload_images/1155603-be3547f8ac743acb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3、配置一下你的静态库工程,

![70D322C1-AAC8-4491-9914-A8CE37CB4064.png](http://upload-images.jianshu.io/upload_images/1155603-922a6c886193a613.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.设置需要暴露的**.h**文件

移除不想打包到**.a**中的多余文件
![7806E8A2-BBAA-4E91-9AD9-E5FFFF3844D9.png](http://upload-images.jianshu.io/upload_images/1155603-9c4485ae3d5c98fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

设置目标**.h**文件
![567C56FF-2D84-481B-9041-83A0F2439F88.png](http://upload-images.jianshu.io/upload_images/1155603-f33a12101ed47982.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![90EF3A64-CA7F-4C19-B512-7927823EAEB0.png](http://upload-images.jianshu.io/upload_images/1155603-5d97b211e9e31f56.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![326B2708-D0F1-4797-8507-1DDBA2471565.png](http://upload-images.jianshu.io/upload_images/1155603-0cf89e083f259c16.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5.选择编译环境，**release**,生成静态库

![80177F66-19F4-44B5-A07B-48DC4B955860.png](http://upload-images.jianshu.io/upload_images/1155603-cdf7b1afa8fa8cb6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![7D37C179-B156-410D-801A-67549E1888B2.png](http://upload-images.jianshu.io/upload_images/1155603-4751dc7e586f8a0f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

6.选择静态库目标环境，**真机环境**或者**模拟器环境**，建议选择**真机**，这样编译后**.a**文件才会变色，如果选择的是模拟器，即使编译通过了，**.a**文件也不会由**红**变**黑**，实际上是已经编译了模拟器的，只是xcode对模拟器编译过得静态库还是红色的，其实已经生成了.a文件

![
![C125C69B-79DA-41BE-8D17-6A5D24947B60.png](http://upload-images.jianshu.io/upload_images/1155603-1d76392835d4e7bc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
](http://upload-images.jianshu.io/upload_images/1155603-7d494547320cd90e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**comand+B**然后可以看到**libStaticLibTest.a**已经变成黑色，然后**show in finder**即可

6.静态库的使用
以前几步制作的**libStaticLibTest.a**为例一下静态库的使用
在新工程中导入已经编辑好的**.a**文件和头文件

![269777A5-9E1D-4BA0-A53E-D6685067F63B.png](http://upload-images.jianshu.io/upload_images/1155603-bf1c341903aadda9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
#import "ViewController.h"
#import "FGToast.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [FGToast showTips:@"测试成功"];
}

```
运行效果:


![IMG_1998.PNG](http://upload-images.jianshu.io/upload_images/1155603-a7c4e089ff10a27a.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

7.**模拟器.a**和**真机.a**的合并使用，支持真机和模拟器。注意：合并后的**.a**体积大约是单独包的2倍左右。
- 按照之前步骤，编译一个模拟器环境的**.a**

![3E528CE8-E570-4BB3-95BF-FCFBE20FFB9C.png](http://upload-images.jianshu.io/upload_images/1155603-25fd97872a91257c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 新建一个文件夹，将两个.a扔进去

![1E035FF5-5699-4292-9762-D0F2188687AF.png](http://upload-images.jianshu.io/upload_images/1155603-6ca49d6b413067e5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 进行合并操作
 - 在终端输入：

```
➜  ~ lipo  -create /Users/Fengur/Desktop/StaticLib/Release-iphonesimulator/libStaticLibTest.a /Users/Fengur/Desktop/StaticLib/Release-iphoneos/libStaticLibTest.a -output /Users/Fengur/Desktop/StaticLib/StaticTestCombine.a 
```
**lipo -create** **simulator.a**(路径) **iphone.a**（路径） **-output** 输出路径（包含合并后**.a**名称）
- 合并完成，使用合并后的**.a**即可

![31B0992F-CE6A-4CBD-9DB6-9F2C89D34525.png](http://upload-images.jianshu.io/upload_images/1155603-bbd1238b1a597864.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- Demo代码与效果

```

#import "ViewController.h"
#import "FGToast.h"

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR @"模拟器"
#elif TARGET_OS_IPHONE
#define SIMULATOR @"真机"
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [FGToast showTips:[NSString stringWithFormat:@"!!%@!!测试效果",SIMULATOR]];
}

```

![Simulator Screen Shot 2016年11月21日 13.15.26.png](http://upload-images.jianshu.io/upload_images/1155603-c71ada2de300a85d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

8.以上测试工程 [传送门](https://github.com/Fengur/FGStaticLibTest) Demo中有三个工程：
-  **StaticLibTest** 为生产静态库工程
- **StaticVerify** 为单独真机静态库效果
- **CombineStaticLibVerify** 为合并静态库效果

9.有错误或者补充，敬请提醒。
