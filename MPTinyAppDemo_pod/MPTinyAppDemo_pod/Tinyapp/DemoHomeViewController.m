//
//  DemoHomeViewController.m
//  Portal
//
//  Created by yemingyu on 2019/6/24.
//  Copyright © 2019 Alibaba. All rights reserved.
//

#import "DemoHomeViewController.h"
#import <MPNebulaAdapter/MPNebulaAdapterInterface.h>
#import "MPDemoTinyScanHelper.h"
#import <APMobileNetwork/DTRpcClient.h>
#import "MPAccountDemoHomeViewController.h"

const static CGFloat interval = 60.0f;

static NSArray *getDemoTinyAppList(){
    static NSArray *array = nil;
    if (array == nil) {
        array = @[@[@"2020012000000001", @"测试小程序"]];
    }
    return array;
}


@interface DemoHomeViewController () <UINavigationControllerDelegate,UIActionSheetDelegate>

@property (nonatomic,strong) UIButton *openTinyAppBtn;
@property (nonatomic,strong) UIButton *openNeedAuthTinyAppBtn;
@property (nonatomic,strong) UIButton *debugBtn;
@property (nonatomic,strong) UIButton *openDebugTinyAppBtn;

@end

@implementation DemoHomeViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"bundlePath:%@",[NSBundle mainBundle].bundlePath);
    NSLog(@"DocumePath:%@",NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, 1, 1));
    NSLog(@"LibrarPath:%@",NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1, 1));
    
    
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    button0.frame = CGRectMake(30, 80, [UIScreen mainScreen].bounds.size.width-60, 44);
    button0.backgroundColor = [UIColor blueColor];
    [button0 setTitle:@"H5" forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(openH5Demo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectOffset(button0.frame, 0, interval);
    [button2 setTitle:@"启动小程序Demo" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(openTinyApp:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor blueColor];
    self.openTinyAppBtn = button2;
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectOffset(button2.frame, 0, interval);
    [button3 setTitle:@"调试/预览小程序" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(openTinyAppForDebugMode:) forControlEvents:UIControlEventTouchUpInside];
    button3.backgroundColor = [UIColor blueColor];
    self.openNeedAuthTinyAppBtn = button3;
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectOffset(button3.frame, 0, interval);
    [button4 setTitle:@"打开本地包" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(openLocalPreset:) forControlEvents:UIControlEventTouchUpInside];
    button4.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectOffset(button4.frame, 0, interval);
    [button5 setTitle:@"打开账户通接口首页" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(openAccountDemo:) forControlEvents:UIControlEventTouchUpInside];
    button5.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button5];
}

- (void)openH5Demo:(id)sender {
     [MPNebulaAdapterInterface startTinyAppWithId:@"20000069" params:@{@"url":@"https://m.taobao.com",@"enableWK":@"YES"}];

}
- (void)openTinyApp:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"打开小程序"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    [getDemoTinyAppList() enumerateObjectsUsingBlock:^(NSArray  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [actionSheet addButtonWithTitle:obj[1]];
    }];
    [actionSheet showInView:self.view];
}

- (void)openLocalPreset:(id)sender
{
    [[MPNebulaAdapterInterface shareInstance] startH5ViewControllerWithNebulaApp:@{@"appId":@"20180910"}];
}

- (void)openAccountDemo:(id)sender
{
    MPAccountDemoHomeViewController *vc = [[MPAccountDemoHomeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        return; //cancel
    }
    NSArray *item = getDemoTinyAppList()[buttonIndex-1];
    [MPNebulaAdapterInterface startTinyAppWithId:item[0] params:nil];
}

- (void)openTinyAppForDebugMode:(id)sender
{
    [[MPDemoTinyScanHelper sharedInstance] startScanWithNavVc:self.navigationController];
}

@end
