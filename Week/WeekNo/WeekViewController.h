//
//  WeekViewController.h
//  WeekNo
//
//  Created by zcznx on 15/11/12.
//  Copyright © 2015年 znx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  WeekViewControllerDelegate <NSObject>

-(void)timeLabel:(NSMutableArray *)array;

@end
@interface WeekViewController : UIViewController
@property(nonatomic,assign)id <WeekViewControllerDelegate>delegate;
@end
