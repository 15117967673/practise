//
//  SettingViewController.h
//  exercise
//
//  Created by Happigo on 14-10-15.
//  Copyright (c) 2014年 HappiVision. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShowTabBarDelegate <NSObject>

- (void)showTabBar;

@end

@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) id <ShowTabBarDelegate> delegate;
@end
