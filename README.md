![](https://raw.githubusercontent.com/flutter/website/master/src/_assets/image/flutter-lockup-bg.jpg)
# About 躲猫猫🐱
- 一个专门为年轻人打造的社交短视频平台
- 用Flutter2打造的一套代码跨多端的应用。
- 本仓库使用Flutter2跨多端，现已支持APP、Web，全面启用空安全
- 目前的技术选型：
    - 躲猫猫官网：React(性能优化的最佳实践)
    - APP(ios android web)；Flutter2.2(拥抱空安全，多端运行, google ads，navigator2)
    - 后端服务：Go
- 未来的计划：
    - 主打**社交** + **短视频**
    - Go助力后端服务，包含RabbitMQ、分布式、微服务、Docker、CI/CD、OSS
    - Ffmpeg助力短视频，WebRTC助力实时音视频通话，Tensorflow2助力推荐系统, Python助力大数据分析
    - 躲猫猫短视频下载器：C(windows)
    - 躲猫猫视频播放器：C++(QT)
      
# Development environment

[后端开发是本地部署，所以登陆时候，请切换values/server.dart的server_url]
- flutter env
```go
[√] Flutter (Channel stable, 2.2.0, on Microsoft Windows [Version 10.0.19043.985], locale zh-CN)
    • Flutter version 2.2.0 at D:\flutter
    • Framework revision b22742018b (4 weeks ago), 2021-05-14 19:12:57 -0700
    • Engine revision a9d88a4d18
    • Dart version 2.13.0
    • Pub download mirror https://pub.flutter-io.cn
    • Flutter download mirror https://storage.flutter-io.cn

[√] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at D:\AndroidSDK
    • Platform android-30, build-tools 30.0.3
    • ANDROID_HOME = D:\AndroidSDK
    • Java binary at: D:\Android Studio\jre\bin\java
    • Java version OpenJDK Runtime Environment (build 11.0.8+10-b944.6842174)
    • All Android licenses accepted.

[√] Chrome - develop for the web
    • Chrome at C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

[√] Android Studio (version 4.1.0)
    • Android Studio at D:\Android Studio
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.8+10-b944.6842174)

[√] IntelliJ IDEA Ultimate Edition (version 2020.1)
    • IntelliJ at D:\IntelliJ IDEA\IntelliJ IDEA 2018.3.5
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart

[√] Connected device (3 available)
    • Android SDK built for x86 (mobile) • emulator-5554 • android-x86    • Android 10 (API 29) (emulator)
    • Chrome (web)                       • chrome        • web-javascript • Google Chrome 90.0.4430.72
    • Edge (web)                         • edge          • web-javascript • Microsoft Edge 91.0.864.4
```
- IDE: AndroidStudio4.2.1


## 程序图标

制作：https://www.designevo.com/logo-maker/

参考Android和iOS的最大尺寸[1024*1024]

然后FlutterLaunchIcons:https://pub.dev/packages/flutter_launcher_icons

## 启动图

制作：https://www.canva.cn/design/DAEZRss1im4/MReV8kx4yCpmmJpLMtf9QQ/edit

在线生成不同的图片格式：https://hotpot.ai/icon-resizer?s=sidebar

然后将android/res/下的相关图片覆盖并修改drawable配置即可。

## 程序名称

android下的清单文件下改label

## 生成证书

AS可GUI操作，

如果命令操作,进入app输入如下命令：

```js
keytool -genkey -v -keystore ./key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

将在android/app/下生成key.jks

然后android下新建key.properties编写配置。

最后修改android/app/build.gradle配置即可。

【上述语法需要gradle知识】

## 混淆

android/gradle.properties添加：

```js
extra-gen-snapshot-options=--obfuscate
```

修改build相关release配置即可。

## 编译打包

```js
flutter build apk --split-per-abi
```

打出的v8兼容v7,对外发布一般用v7包，x86是模拟器

## 错误上报
Sentry: https://sentry.io/welcome/

# Community

## Community channels

If you have questions, or would like any assistance regarding the use of this source code, please join our community channels, your question will be answered more quickly, and it will be the most suitable place. This repository is exclusive for opening issues, and requesting resources, but feel free to be part of Hide-Seek-Cat Community.

| **QQ**                                                                                                                   | **WeChat**                                                                                                                 | **Telephone**                                                                                                          |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------- |
| 1099129793 | yl1099129793 | 13795950539 |

## How to contribute

_Want to contribute to the project? We will be proud to highlight you as one of our collaborators. Here are some points where you can contribute and make this product (and Flutter) even better._

- Helping to translate the readme into other languages.
- Adding documentation to the readme (a lot of go's functions haven't been documented yet).
- Write articles or make videos teaching how to use go (they will be inserted in the Readme and in the future in our Wiki).
- Offering PRs for code/tests.
- Including new functions.

Any contribution is welcome!

## Articles and videos

- [YouTube](https://www.youtube.com/channel/UClg53fJlRO-5GAwGoHjxP0A)
- [BiliBili](https://space.bilibili.com/355529756)
- [微信公众号(尹哥)](https://mp.weixin.qq.com/s?__biz=MzU2NzkxMzg2NQ==&mid=2247486880&idx=1&sn=d0092b467c18210798467b3aaf5121bb&chksm=fc94b146cbe33850ee820e42d1b483b3207652d1ea5410630caf3ce69c519b5147d717e2b259&token=812813886&lang=zh_CN#rd)