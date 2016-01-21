//
//  DanceDetailCellAnother.h
//  Dancer
//
//  Created by qianfeng on 15/8/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DanceDetailModel.h"
#import "DanceDetailBasicCell.h"
@interface DanceDetailCellAnother : DanceDetailBasicCell
@property (weak, nonatomic) IBOutlet UIImageView *smallImage;
@property (weak, nonatomic) IBOutlet UILabel *smallLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickNum;
-(void)customModel:(DanceDetailModel *)model;
@end
