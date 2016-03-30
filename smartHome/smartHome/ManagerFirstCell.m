//
//  ManagerFirstCell.m
//  smartHome
//
//  Created by zcznx on 15/10/28.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "ManagerFirstCell.h"

@implementation ManagerFirstCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *subView in self.subviews) {
        if ([NSStringFromClass([subView class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]) {
            ((UIView *)[subView.subviews firstObject]).backgroundColor = [UIColor colorWithRed:0.0706 green:0.5490 blue:0.0118 alpha:1];
            ((UILabel *)[subView.subviews lastObject]).font=[UIFont systemFontOfSize:25];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
