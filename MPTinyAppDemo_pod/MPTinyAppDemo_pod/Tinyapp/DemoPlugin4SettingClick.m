//
//  DemoPlugin4SettingClick.m
//  Portal
//
//  Created by 张光宇 on 2019/5/10.
//  Copyright © 2019 Alibaba. All rights reserved.
//

#import "DemoPlugin4SettingClick.h"
#import <NebulaSDKPlugins/NebulaSDKPlugins.h>
@implementation DemoPlugin4SettingClick


- (void)pluginDidLoad
{
    [self.target addEventListener:kNBInsideEvent_Scene_NavbarMenu_Right_Setting withListener:self useCapture:NO];
}

- (void)handleEvent:(PSDEvent *)event{
    if ([event.eventType isEqualToString:kNBInsideEvent_Scene_NavbarMenu_Right_Setting]) {
        [[[UIAlertView alloc] initWithTitle:@"测试"
                                    message:@"Demo测试"
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"确定", nil] show];
    }
}
@end
