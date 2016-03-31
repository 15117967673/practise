//
//  ZhuShiCell.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ZhuShiCell.h"
#import "UIImageView+AFNetworking.h"
@implementation ZhuShiCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)customModel:(ZhuShiModel *)model
{
    _nameLabel.text=model.name;
    [_magePathThumbnails setImageWithURL:[NSURL URLWithString:model.magePathThumbnails]];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
