//
//  SQPengYouQuanController.m
//  WXApp
//
//  Created by 石学谦 on 16/7/17.
//  Copyright © 2016年 shixueqian. All rights reserved.
//

#import "SQPengYouQuanController.h"

@interface SQPengYouQuanController ()

//标题label
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//内容label
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation SQPengYouQuanController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self displayWithURL:self.url];
}

//设置分享后的内容
- (void)displayWithURL:(NSURL *)url {
    
    //获取url中的参数，转化为字典
    NSDictionary *params = [self getParamsWithURL:url];
    NSLog(@"dict=====\n%@",params);
    
    //给label设置值
    self.titleLabel.text = params[@"title"];
    self.contentLabel.text = params[@"content"];
    
    //延迟5秒再弹出alertView
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //创建alertviewController
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"分享后的操作" message:@"是否返回原应用？" preferredStyle:UIAlertControllerStyleAlert];
        
        //返回按钮
        UIAlertAction *backAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //从字典中取出URL Schemes
            NSString *backURLString = [NSString stringWithFormat:@"%@://",params[@"urlschemes"]];
            NSURL *backURL = [NSURL URLWithString:backURLString];
            //跳转回MyApp
            [[UIApplication sharedApplication] openURL:backURL];
        }];
        [controller addAction:backAction];
        
        //留在微信按钮
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"留在微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"留在微信");
        }];
        [controller addAction:cancelAction];
        
        //展示alertView
        [self presentViewController:controller animated:YES completion:nil];
        
    });
    
}


//将url里面的参数转换成字典
- (NSDictionary *)getParamsWithURL:(NSURL *)url {
    
    //query是？后面的参数，在这个demo中，指的是title=hello&content=helloworld&urlschemes=shixueqian
    NSString *query = url.query;
    
    //进行字符串的拆分，通过&来拆分，把每个参数分开
    NSArray *subArray = [query componentsSeparatedByString:@"&"];
    //把subArray转换为字典
    //tempDic中存放一个URL中转换的键值对
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    
    for (int i = 0 ; i < subArray.count ; i++) {
        //通过“=”拆分键和值
        NSArray *dicArray = [subArray[i] componentsSeparatedByString:@"="]
        ;
        //给字典加入元素,=前面为key，后面为value
        [tempDic setObject:dicArray[1] forKey:dicArray[0]];
    }
    //返回转换后的字典
    return tempDic ;
}



@end
