//
//  ControllerCell.h
//  smartHome
//
//  Created by zcznx on 15/10/28.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlModel.h"
@interface ControllerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *LightImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *currentLable;
@property (weak, nonatomic) IBOutlet UILabel *voltageLable;
@property (weak, nonatomic) IBOutlet UILabel *elcLable;
@property (weak, nonatomic) IBOutlet UISwitch *isOn;
-(void)customModel:(ControlModel *)model;
@end
