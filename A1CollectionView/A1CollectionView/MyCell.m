//
//  MyCell.m
//  A1CollectionView
//
//  Created by Mac on 15-8-8.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        _label.backgroundColor=[UIColor yellowColor];
        _label.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
        
        _iconView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width, self.frame.size.height-20)];
        [self.contentView addSubview:_iconView];
    }
    return self;
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
