//
//  XXSTableViewCell.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "XXSTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation XXSTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}
-(void)customModel:(XXSModel *)model
{
    _nameLabel.text=model.name;
    _content.text=model.content;
    [_titleImageFile setImageWithURL:[NSURL URLWithString:model.titleImageFile]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
