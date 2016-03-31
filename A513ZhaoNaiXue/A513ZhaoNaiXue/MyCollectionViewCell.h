//
//  MyCollectionViewCell.h
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllModel.h"
@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
-(void)customModel:(AllModel *)model;
@end
