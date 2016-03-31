//
//  XXSTableViewCell.h
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXSModel.h"
@interface XXSTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageFile;
@property (weak, nonatomic) IBOutlet UILabel *content;
-(void)customModel:(XXSModel *)model;
@end
