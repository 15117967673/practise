//
//  VegCell.h
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-21.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VegModel.h"
@interface VegCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
-(void)customModel:(VegModel *)model;
@end
