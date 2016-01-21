//
//  DanceWebView.m
//  Dancer
//
//  Created by qianfeng on 15/9/1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DanceWebView.h"

@interface DanceWebView ()

@end

@implementation DanceWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
    webView.tag = 1;
    //webView.delegate = self;
    [self.view addSubview:webView];
    
    //代表网址的字符串
    NSString *str = _strUrl;
    
    //将字符串转成网址类对象
    NSURL *url = [NSURL URLWithString:str];
    
    //使用一个网址生成一个网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //让一个网页视图开始加载一个网络请求
    [webView loadRequest:request];
    
    //允许页面缩放
    webView.scalesPageToFit = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
