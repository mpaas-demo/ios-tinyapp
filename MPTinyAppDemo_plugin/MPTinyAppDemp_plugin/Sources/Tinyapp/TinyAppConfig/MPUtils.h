//
//  MPUtils.h
//  LogH5Test
//
//  Created by yangwei on 2020/1/9.
//  Copyright © 2020 yangwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NebulaSDKPlugins/TAAuthorizeStorageManager.h>
#import <TinyappService/TASUtils.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPUtils : NSObject<MPNebulaAdapterInterfaceConfigProtocol, MPNebulaAdapterInterfaceAuthorizeAlert,TACustomGlobalMenuItem, UIAlertViewDelegate>

@property (nonatomic, copy) void (^callback)(NSInteger index);

+ (instancetype)shareInstance;

- (void)showAlertWithTitle:(NSString *)title appName:(NSString *)appName storageKey:(NSString *)storageKey callback:(void (^)(NSInteger index))callback;
@end

NS_ASSUME_NONNULL_END
