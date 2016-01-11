//
//  TableViewCell.m
//  WeekNo
//
//  Created by zcznx on 15/11/12.
//  Copyright © 2015年 znx. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)customModel:(Model *)model
{
    self.nameLable.text=model.name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
