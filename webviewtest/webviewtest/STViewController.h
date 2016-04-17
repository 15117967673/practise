//
//  STViewController.h
//  webviewtest
//
//  Created by Sunsunny on 14/11/25.
//  Copyright (c) 2014年 Sunsunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STViewController : UIViewController<UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIWebView   * webView;
@property (nonatomic, strong) UITableView * tableVIew;

@end
