//
//  VegCell.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-21.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "VegCell.h"
#import "UIImageView+AFNetworking.h"
@implementation VegCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)customModel:(VegModel *)model
{
    _nameLable.text=model.name;
    _image.image=[UIImage imageNamed:model.imageFilename];
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
