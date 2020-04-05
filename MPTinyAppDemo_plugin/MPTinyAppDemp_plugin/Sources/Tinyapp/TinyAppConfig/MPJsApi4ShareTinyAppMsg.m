//
//  MTJsApiHandler4OpenSms.m
//  MTPotal
//
//  Created by lizhen on 2017/9/5.
//  Copyright © 2017年 Alibaba. All rights reserved.
//

#import "MPJsApi4ShareTinyAppMsg.h"
#import <MessageUI/MessageUI.h>      

@interface MPJsApi4ShareTinyAppMsg()<APSKLaunchpadDelegate>

@property(nonatomic, strong) NSString *shareUrlString;

@end

@implementation MPJsApi4ShareTinyAppMsg

- (void)handler:(NSDictionary *)data context:(PSDContext *)context callback:(PSDJsApiResponseCallbackBlock)callback
{
    [super handler:data context:context callback:callback];
    
    NSString * appId = context.currentSession.createParam.expandParams[@"appId"];
    NSString * page = data[@"page"]?:@"";
    NSString * title = data[@"title"]?:@"";
    NSString * desc = data[@"desc"]?:@"";
    
    // 拼接分享的内容，调用分享SDK
    self.shareUrlString = [NSString stringWithFormat:@"http://appId=%@&page=%@&title=%@&desc=desc", appId, page, title, desc];
    [self openPannel];
}

- (void)openPannel {
    NSArray *channelArr = @[kAPSKChannelWeibo, kAPSKChannelWeixin, kAPSKChannelWeixinTimeLine, kAPSKChannelSMS, kAPSKChannelQQ, kAPSKChannelQQZone, kAPSKChannelDingTalkSession, kAPSKChannelALPContact, kAPSKChannelALPTimeLine];
    APSKLaunchpad *launchPad = [[APSKLaunchpad alloc] initWithChannels:channelArr sort:NO];
    launchPad.tag = 1000;
    launchPad.delegate = self;
    
    [launchPad showForView:[[UIApplication sharedApplication] keyWindow] animated:YES];
}

#pragma mark - APSKLaunchpadDelegate
- (void)sharingLaunchpad:(APSKLaunchpad *)launchpad didSelectChannel:(NSString *)channelName {
    [self shareWithChannel:channelName tag:launchpad.tag];
    [launchpad dismissAnimated:YES];
}

- (void)shareWithChannel:(NSString *)channelName tag:(NSInteger)tag{
    APSKMessage *message = [[APSKMessage alloc] init];
    message.contentType = @"url";//类型分"text","image", "url"三种
    message.content = [NSURL URLWithString:self.shareUrlString];
    message.icon = [UIImage imageNamed:@"MPShareKit.bundle/Icon_Laiwang@2x.png"];
    message.title = @"这里是网页标题";
    message.desc = @"这里是描述啦啦啦～";
    APSKClient *client = [[APSKClient alloc] init];
    client.disableToastDisplay = YES;
    
    [client shareMessage:message toChannel:channelName completionBlock:^(NSError *error, NSDictionary *userInfo) {
        if(!error) {// 成功
            [AUToast presentToastWithin:[[UIApplication sharedApplication] keyWindow]
                               withIcon:AUToastIconSuccess
                                   text:@"分享成功"
                               duration:2
                                 logTag:@"demo"];
        } else {// 失败
            NSString *desc = error.localizedFailureReason.length > 0 ? error.localizedFailureReason : @"分享失败";
            [AUToast presentToastWithin:[[UIApplication sharedApplication] keyWindow]
                               withIcon:AUToastIconNone
                                   text:desc
                               duration:2
                                 logTag:@"demo"];
            NSLog(@"error = %@", error);
        }
    }];
}


@end
