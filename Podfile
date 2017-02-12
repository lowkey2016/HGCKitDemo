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
