# 小程序

<a name="UgzsB"></a>
## 功能介绍
本 Demo 主要配合官网 [文档](https://help.aliyun.com/document_detail/67444.html?spm=a2c4g.11186623.6.1097.72a125eaaxoaNF)，介绍 iOS 小程序能力，功能如下：

- 加载小程序容器
- 自定义 JsApi 和 Plugin
- 小程序管理

本 Demo 支持的基线范围：>= 10.1.60

<a name="jFPNB"></a>
## 运行Demo
<a name="teHcF"></a>
### Cocoa Pod 接入：MPTinyAppDemo_pod

1. 执行以下命令，安装 cocoapods-mPaaS 插件 
```shell
sh <(curl -s http://mpaas-ios.oss-cn-hangzhou.aliyuncs.com/cocoapods/installmPaaSCocoaPodsPlugin.sh)
```

2. 修改Podfile，设置基线号，支持设置为 10.1.60、10.1.68-beta


3. 执行以下命令，拉取依赖库
```shell
1、pod mpaas update --all
2、pod update
```

<a name="zlIkG"></a>
### Extension 插件接入

1. 执行以下命令，安装 mPaaS Extension插件，并确认插件版本 >= 1.1.3
```shell
curl -sSL https://mpaas-ios.oss-cn-hangzhou.aliyuncs.com/mpaaskit/Xcode-extension/install.sh | sh
```

2. 点击 “Xcode - Editor - mPaaS - 编辑工程 ” 打开插件面板，切换到“工程概览” TAB，点击安装按钮，拉取依赖


3. 此 demo 默认为 10.1.60基线，您可以切换到 “升级基线” Tab，选择需要的基线
