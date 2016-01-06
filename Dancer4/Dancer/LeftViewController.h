//
//  LeftViewController.h
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DanceTypeModel.h"
@protocol LeftViewControllerDelegate <NSObject>

-(void)modelValue:(NSString *)Id;

@end
@interface LeftViewController : UIViewController

@property(nonatomic,assign)id<LeftViewControllerDelegate>delegate;

@end
