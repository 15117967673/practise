//
//  AACell.h
//  RLZNC
//
//  Created by zcznx on 15/10/19.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AModel.h"
@interface AACell : UITableViewCell
{
    UIImageView *_iconView;
    UILabel *_nameLabel;
    UISwitch *_open;
}
-(void)customWithModel:(AModel *)model;
@end
