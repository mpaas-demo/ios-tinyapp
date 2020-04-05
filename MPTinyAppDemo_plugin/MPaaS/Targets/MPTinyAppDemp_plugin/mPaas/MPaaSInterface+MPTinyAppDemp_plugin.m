//
//  MPaaSInterface+MPTinyAppDemp_plugin.m
//  MPTinyAppDemp_plugin
//
//  Created by 夜禹 on 2019/08/06.
//  Copyright © 2019 Alibaba. All rights reserved.
//

#import "MPaaSInterface+MPTinyAppDemp_plugin.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation MPaaSInterface (MPTinyAppDemp_plugin)

- (BOOL)enableSettingService
{
    return NO;
}

- (NSString *)userId
{
    return @"MPTestCase";
}

- (NSString *)appSchema
{
    return PortalScheme;
}

@end

#pragma clang diagnostic pop
