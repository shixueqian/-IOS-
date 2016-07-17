//
//  AppDelegate.m
//  WXApp
//
//  Created by 石学谦 on 16/7/17.
//  Copyright © 2016年 shixueqian. All rights reserved.
//

#import "AppDelegate.h"
#import "SQPengYouQuanController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSLog(@"url====%@\n sourceApplication====%@\n annotation===%@",url,sourceApplication,annotation);
    
    //判断是否要跳转到朋友圈
    if ([url.absoluteString hasPrefix:@"weixin://dl/moments"]) {
        //创建SQPengYouQuanController控制器
        SQPengYouQuanController *controller = [[SQPengYouQuanController alloc] initWithNibName:@"SQPengYouQuanController" bundle:nil];
        //给url赋值
        controller.url = url;
        
        //找出当前的控制器
        UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        //跳转到朋友圈
        [rootViewController presentViewController:controller animated:YES completion:nil];
        
    } else {
        //不是跳转到朋友圈
    }
    return YES;
}

@end
