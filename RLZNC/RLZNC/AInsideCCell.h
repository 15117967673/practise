//
//  AInsideCCell.h
//  RLZNC
//
//  Created by zcznx on 15/10/20.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AInsideModel.h"
@interface AInsideCCell : UITableViewCell
@property(nonatomic,copy) UILabel *name;
@property(nonatomic,copy) UILabel *time;
@property(nonatomic,copy) UILabel *day;
@property(nonatomic,copy) UISwitch *sw;
@property(nonatomic,copy) UIButton *isOn;
-(void)customWithModel:(AInsideModel *)model;

@end
