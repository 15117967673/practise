//
//  DanceDetailCell.h
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DanceDetailModel.h"
#import "DanceDetailBasicCell.h"
@interface DanceDetailCell : DanceDetailBasicCell
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickNum;

-(void)customModel:(DanceDetailModel *)model;

@end
