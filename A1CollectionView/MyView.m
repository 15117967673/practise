//
//  MyView.m
//  A1CollectionView
//
//  Created by Mac on 15-8-8.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _label=[[UILabel alloc]initWithFrame:self.frame];
        _label.textAlignment=NSTextAlignmentCenter;
        _label.backgroundColor=[UIColor grayColor];
        [self addSubview:_label];
        
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
