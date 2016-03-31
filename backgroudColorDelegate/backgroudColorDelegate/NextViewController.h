//
//  NextViewController.h
//  backgroudColorDelegate
//
//  Created by Mac on 15-7-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NextViewControllerDelegate <NSObject>

-(void)getColor:(UIColor *)backgroudColor;

@end
@interface NextViewController : UIViewController

@property(nonatomic,assign)id<NextViewControllerDelegate>delegate;

@property(nonatomic,copy)UIColor *color;

@end
