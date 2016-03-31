//
//  BcollectionCell.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "BcollectionCell.h"
#import "UIImageView+AFNetworking.h"
@implementation BcollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)customModel:(BModel *)model
{
    [_imageFilename setImageWithURL:[NSURL URLWithString:model.imageFilename]];
    _nameLable.text=model.name;
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
