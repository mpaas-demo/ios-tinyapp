//
//  MPJsApiHandler4CustomAPITest.m
//  MTPotal
//
//  Created by lizhen on 2017/9/5.
//  Copyright © 2017年 Alibaba. All rights reserved.
//

#import "MPJsApiHandler4CustomAPITest.h"

@interface MPJsApiHandler4CustomAPITest()

@property(nonatomic, strong) NSString *shareUrlString;

@end

@implementation MPJsApiHandler4CustomAPITest

- (void)handler:(NSDictionary *)data context:(PSDContext *)context callback:(PSDJsApiResponseCallbackBlock)callback
{
    [super handler:data context:context callback:callback];
    
    callback(data);
}


@end
