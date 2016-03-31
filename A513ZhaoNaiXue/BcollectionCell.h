//
//  BcollectionCell.h
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BModel.h"
@interface BcollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageFilename;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
-(void)customModel:(BModel *)model;
@end
