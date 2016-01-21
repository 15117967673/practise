//
//  AppDelegate.h
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderViewController.h"
#import "RESideMenu.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,RESideMenuDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)RESideMenu *sideMenuViewController;
@property(nonatomic,strong)UIScrollView *sv;

@end

