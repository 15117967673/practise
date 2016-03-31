//
//  RootViewController.h
//  A1NavigationController
//
//  Created by Mac on 15-7-20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
//只有在.h文件里声明，此方法才可以被继承
-(void)customBackButtonwithTitle:(NSString *)titleStr action:(SEL)action;

@end
