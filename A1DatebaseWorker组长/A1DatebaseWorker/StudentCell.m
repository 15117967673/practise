//
//  StudentCell.m
//  A1DatebaseWorker
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "StudentCell.h"
#import "UIImageView+WebCache.h"

@implementation StudentCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)customWithModel:(StudentModel *)sm
{
    _nameLabel.text = sm.username;
    _ageLabel.text = sm.uid;
    _numLabel.text = [NSString stringWithFormat:@"%@",sm.lastactivity];
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.0.8.8/sns%@",sm.headimage]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
