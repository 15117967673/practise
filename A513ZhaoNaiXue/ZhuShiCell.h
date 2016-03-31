//
//  ZhuShiCell.h
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhuShiModel.h"
@interface ZhuShiCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *magePathThumbnails;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
-(void)customModel:(ZhuShiModel *)model;
@end
