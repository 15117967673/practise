//
//  MyCollectionViewCell.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)customModel:(AllModel *)model
{
    [_image setImageWithURL:[NSURL URLWithString:model.imageFilename]];
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
