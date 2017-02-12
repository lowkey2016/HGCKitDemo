# HGCKitDemo

## 简介

HGCKit 是我从之前的 App / SDK 开发时抽离出来的工具库。

主要组件：

```
- Base
 	- HGCMacros: 提供各种常用的宏
	- Foundation
		- HGCFoundationUtil: 提供对 string, array 等 Foundation 类的快捷操作
	- UIKit
 		- HGCFontFactory: 快速获取 light/regular/bold 的字体
		- HGCGradientNavigationBar: 颜色渐变的 NavigationBar
		- HGCNavigationController: 在各种 push controller 的场景做了防呆
- Utils
	- Categories: 包括字符串常用、颜色RGB、文字算高、加载网络图片并拉伸剪切缓存、Block 式的 UIAlertView/UIActionSheet、UITableView/UICollectionView 快速添加上拉下拉刷新组件、UINavigationBar 动态设置透明度等
	- Info: 获取 App 的版本号包名等信息，获取设备的各种硬件信息
	- Logger: 配合 CocoaLumberjack 使用
	- WebKitWrapper: 简单封装了 UIWebView 和 WKWebView
	- Storage: 包括 Sandbox File 管理，User Defaults 管理和 Keychain 管理
	- UIView: 快速创建各种基本的 UI 组件，如 UILabel, UIButton 等，提高编码效率
	- UIViewController: 提供各种 UIViewController/UITableViewController/UICollectionViewController/WebViewController 的基类
	- MasonryWrapper: 封装了 Masonry，提供链式调用语法写 UI
	- Image: 闪屏图片管理
	- ...
- Resources: 一些资源文件 
```

## 接入

CocoaPods

```
platform :ios, '8.0'
use_frameworks!

def share_pods
    # 网络
    pod 'AFNetworking'
    pod 'SDWebImage'
    
    # 调试
    pod 'CocoaLumberjack', '~> 2.4.0'
    
    # UI
    pod 'Masonry'
    pod 'MJRefresh'
    pod 'NYXImagesKit'
    pod 'ALAlertBanner'
    pod 'YYText'
    
    # ShareSDK
    # 主模块(必须)
    pod 'ShareSDK3'
    # Mob 公共库(必须) 如果同时集成SMSSDK iOS2.0:可看此注意事项：http://bbs.mob.com/thread-20051-1-1.html
    pod 'MOBFoundation'
    # 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
    pod 'ShareSDK3/ShareSDKPlatforms/QQ'
    pod 'ShareSDK3/ShareSDKPlatforms/SinaWeibo'
    pod 'ShareSDK3/ShareSDKPlatforms/WeChat'
    
    inhibit_all_warnings!
end

# Target for App
target "HGCKitDemo" do
    share_pods
end

```

pch

```
#ifdef __OBJC__

    #import <UIKit/UIKit.h>
    #import <Foundation/Foundation.h>
    #import <QuartzCore/QuartzCore.h>

    /** Masonry */
    //define this constant if you want to use Masonry without the 'mas_' prefix
    #define MAS_SHORTHAND   1
    //define this constant if you want to enable auto-boxing for default syntax
    #define MAS_SHORTHAND_GLOBALS   1
    #import "Masonry.h"

    /** CocoaLumberjack */
    #import "CocoaLumberjack.h"
    #ifdef TD_DEBUG_MODE
        static const DDLogLevel ddLogLevel = DDLogLevelAll;
    #else
        static const DDLogLevel ddLogLevel = DDLogLevelWarning;
    #endif
    #define LOG_LEVEL_DEF ddLogLevel

#endif
```

Build Settings

- Precompile Prefix Header 设置为 YES
- Prefix Header 设置上面的 pch 文件的路径
- Documentation Comments 关掉（可选）

具体参考 Demo.
