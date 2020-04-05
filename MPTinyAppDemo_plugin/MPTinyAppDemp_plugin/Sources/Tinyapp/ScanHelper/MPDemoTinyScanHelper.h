//
//  MPDemoTinyScanHelper.h
//  MPTinyAppDemo
//
//  Created by yemingyu on 2019/6/19.
//  Copyright © 2019 alipay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPDemoTinyScanHelper : NSObject

+ (instancetype)sharedInstance;

- (void)startScanWithNavVc:(UINavigationController *)navVC;

@end

NS_ASSUME_NONNULL_END
