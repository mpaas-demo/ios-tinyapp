//
//  ViewController.m
//  picc
//
//  Created by tangtian on 2019/3/19.
//  Copyright © 2019 tangtian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"TinyAppDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 150, [UIScreen mainScreen].bounds.size.width-60, 44);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"加载预置小程序" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openPresetTinyApp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectOffset(button.frame, 0, 80);
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"加载远程小程序" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(openRemoteTinyApp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)openPresetTinyApp {
    [[MPNebulaAdapterInterface shareInstance] startH5ViewControllerWithNebulaApp:@{@"appId":@"2018080616290001"}];
//    [DTContextGet() startApplication:@"2018080616290001" params:nil animated:YES];
}

- (void)openRemoteTinyApp {
    [[MPNebulaAdapterInterface shareInstance] startH5ViewControllerWithNebulaApp:@{@"appId":@"1234567891234567"}];
}


@end
