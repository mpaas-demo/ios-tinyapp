//
//  AppDelegate.m
//  picc
//
//  Created by tangtian on 2019/3/19.
//  Copyright © 2019 tangtian. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoHomeViewController.h"
//#import "MPH5WebViewController.h"

#if ENABLE_ACCOUNT
#import <InsideService/ANXInsideService.h>
#import <InsideSchemeService/ANXSchemeModel.h>
#import <AlipaySDK/AlipaySDK.h>
#endif
@interface AppDelegate ()

@end

@implementation AppDelegate


+ (AppDelegate *)sharedInstance
{
    return [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[DFNavigationController alloc] initWithRootViewController:[[DemoHomeViewController alloc]init]];
    self.navigationController = self.window.rootViewController;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // navigationcontroller创建完成后，启动 mPaaS 框架
    [[DTFrameworkInterface sharedInstance] manualInitMpaasFrameworkWithApplication:application launchOptions:launchOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#if ENABLE_ACCOUNT
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([url.host containsString:@".inside.com"]) {
        ANXSchemeModel *model = [[ANXSchemeModel alloc] init];
        model.schemeURL = url.absoluteString;
        model.trojan = NO;
        model.jailBreak = NO;
        model.currentOperateMobile = @"";
        model.scheme = PortalScheme;
        
        [[ANXInsideService sharedService] startServiceWithModel:model completion:^(NSDictionary *result, NSError *error) {
            NSLog(@"scheme处理");
        }];
        return YES;
        //        return DTFrameworkCallbackResultReturnYES;
    } else if ([url.host containsString:@"safepay"])
    {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
    }
    
    // TODO: 其他跳转逻辑
    return YES;
}
#endif

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//    NSDictionary *openURLQuerys = [ScanHelper parseQuery:url.absoluteString];
//    if (openURLQuerys[@"qrcode"]) {
//        //    NSDictionary *params = @{SCAN_RPC_TYPE:SCAN_RPC_QRCODE_TYPE,SCAN_RPC_CODE:@"https://qr.alipay.com/s5x09263krgoompij3ehd62"};
//        //        NSString *qrCode = @"https://qr.alipay.com/s5x09416fcxir5h9vzer9b6";
//        NSString *qrCode = openURLQuerys[@"qrcode"];
//        [ScanHelper routeAndGotoQrCode:qrCode];
//    }else{
//        [ScanHelper routeAndGotoQrCode:url.absoluteString];
//    }
//    return YES;
//    //   NSURLComponents *comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:false];
//    //    comp.scheme = @"alipays";
//    //    NSURL *changedURL = comp.URL;
//    //    return [[DFClientDelegate sharedDelegate] application:application openURL:changedURL sourceApplication:sourceApplication annotation:annotation];
//}


@end
