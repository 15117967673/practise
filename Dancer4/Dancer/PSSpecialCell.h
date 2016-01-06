//
//  PSSpecialCell.h
//  Dancer
//
//  Created by qianfeng on 15/8/30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PSCollectionViewCell.h"
#import "SpecialModel.h"
@interface PSSpecialCell : PSCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame;
//@property (weak, nonatomic) IBOutlet UIImageView *image;
//@property (weak, nonatomic) IBOutlet UILabel *content;

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *captionLabel;

@end
