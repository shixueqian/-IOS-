//
//  ViewController.m
//  MyApp
//
//  Created by 石学谦 on 16/7/17.
//  Copyright © 2016年 shixueqian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


- (IBAction)sharedToPengYouQuan:(UIButton *)sender {
    
    //创建一个url，这个url就是WXApp的url，记得加上：//
    NSURL *url = [NSURL URLWithString:@"weixin://dl/moments?title=hello&content=helloworld&urlschemes=shixueqian"];
    
    //先判断是否能打开该url
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        //打开url
        [[UIApplication sharedApplication] openURL:url];
    } else {
        //给个提示或者做点别的事情
        NSLog(@"打不开weixin://。请检查有没有设置URL Schemes白名单或者有没有安装带有weixin://的应用");
    }
    
}

@end
