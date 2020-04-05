//
//  MPaaSInterface+MPTinyAppDemo_pod.m
//  MPTinyAppDemo_pod
//
//  Created by yangwei on 2019/03/27. All rights reserved.
//

#import "MPaaSInterface+MPTinyAppDemo_pod.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation MPaaSInterface (MPTinyAppDemo_pod)

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

