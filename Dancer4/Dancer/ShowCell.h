//
//  ShowCell.h
//  Dancer
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowModel.h"
@interface ShowCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *keywordsLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
-(void)customModel:(ShowModel *)model;

@end
