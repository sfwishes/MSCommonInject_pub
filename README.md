# 基于iosOpenDev的mobilesubstrict注入dylib框架

## 使用方法：
```
1. 添加要挂钩的app的hook类（appHook），继承自MSHook
2. 添加要挂钩的app中的类的名称，继承自MSHookClass(appHookClass)，实现virtual bool hook() = 0;函数，参考MSDemoHookClass类
3. 在appHook类的构造函数中添加appHookClass，参考MSDemoHook类
4. 在MSCommonInject.mm中static PROCESS_INFO processInfos[]添加对应的app的信息
5. 在MSCommonInject.plist中的Bundles下面添加对应app的BundleId
6. 将工程设置的targets中的IOSOpenDevDevice中得ip换成你自己的
7. 菜单栏-》product->build for->profiling
```
