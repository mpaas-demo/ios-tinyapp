//
//  MPCustomPluginsJsapisDemo.m
//  Portal
//
//  Created by yemingyu on 2019/7/8.
//  Copyright © 2019 Alibaba. All rights reserved.
//

#import "MPCustomPluginsJsapisDemo.h"
#import <NebulaSDK/NBPluginBase.h>

// 自定义/覆盖原有 jsapi、自定义/覆盖原有 plugin 写法

/*
@interface MyJSApi4Toast : PSDJsApiHandler
@end
@implementation MyJSApi4Toast
+ (void)initialize
{
    if (self == [MyJSApi4Toast class]) {
        NSLog(@"MyJSApi4Toast loaded");
    }
}

- (void)handler:(NSDictionary *)data context:(PSDContext *)context callback:(PSDJsApiResponseCallbackBlock)callback{
    NSLog(@"MyJSApi4Toast:%@",data);
}
@end

@interface MyTestPlugin : NBPluginBase

@end

@implementation MyTestPlugin
- (void)pluginDidLoad{
    NSLog(@"MyTestPlugin:pluginDidLoad");
    self.scope = kPSDScope_Scene; // 1
    [self.target
     addEventListener:kNBEvent_Scene_TitleView_Title_Click // 2
     withListener:self // 3
     useCapture:NO]; // 4
}

- (void)handleEvent:(PSDEvent *)event{
    NSLog(@"MyTestPlugin:handleEvent:%@",event);
}

@end

*/
@implementation MPCustomPluginsJsapisDemo

@end
