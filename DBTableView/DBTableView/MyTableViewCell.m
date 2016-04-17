//
//  MyTableViewCell.m
//  DBTableView
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation MyTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}
-(void)customModel:(Model *)model
{
    NSString *str=[NSString stringWithFormat:@"http://10.0.8.8/sns%@",model.headimage];
    [_headimage setImageWithURL:[NSURL URLWithString:str]];
    _uid.text=model.uid;
    _username.text=model.username;
    _lastactivity.text=[NSString stringWithFormat:@"%@",model.lastactivity];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
