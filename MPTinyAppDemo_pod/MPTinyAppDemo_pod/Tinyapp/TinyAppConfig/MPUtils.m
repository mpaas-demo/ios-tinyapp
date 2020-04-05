//
//  MPUtils.m
//  LogH5Test
//
//  Created by yangwei on 2020/1/9.
//  Copyright © 2020 yangwei. All rights reserved.
//

#import "MPUtils.h"

@implementation MPUtils

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static MPUtils *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[MPUtils alloc] init];
        
        // 显示菜单面板和分享按钮
        [TASUtils sharedInstance].shoulShowSettingMenu = YES;
        
        // 自定义菜单面板Item
        [TASUtils sharedInstance].customMenuItems = @[
                                                      @{@"name":@"返回首页", @"menuIconUrl":@"http://pic.alipayobjects.com/e/201212/1ntOVeWwtg.png"},
                                                      @{@"name":@"收藏", @"menuIconUrl":@"http://pic.alipayobjects.com/e/201212/1ntOVeWwtg.png"},
                                                      @{@"name":@"关于", @"menuIconUrl":@"http://pic.alipayobjects.com/e/201212/1ntOVeWwtg.png"}];
        [TASUtils sharedInstance].delegate = instance;
        
        // 小程序API权限管控
        [TAAuthorizeStorageManager shareInstance].authorizeAlertDelegate = instance;
        
        // 修改容器开关值
        [MPNebulaAdapterInterface shareInstance].configDelegate = instance;
    });
    
    return instance;
}

#pragma mark 自定义分享按钮点击事件回调
- (void)didClickCustomGlobalMenuItem:(NSDictionary *)foundItem
{
    NAMApp *app = foundItem[@"app"];
    NSLog(@"hexi--- %@, %@", app.app_id, foundItem[@"name"]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@|%@|%@", app.app_id, app.main_url, foundItem[@"name"]]
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark 小程序API权限管控
- (void)showAlertWithTitle:(NSString *)title appName:(NSString *)appName storageKey:(NSString *)storageKey callback:(void (^)(NSInteger index))callback
{
    if ([title length] > 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
        
        self.callback = callback;
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.callback) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            self.callback(0);
        }else{
            self.callback(1);
        }
    }
    
}

#pragma mark 修改容器默认开关值
//- (NSDictionary *)nebulaCustomConfig
//{
//    return @{@"h5_tinyAppTitleViewAlignLeftConfig" : @"{\"enable\":\"NO\"}"};
//}

@end
