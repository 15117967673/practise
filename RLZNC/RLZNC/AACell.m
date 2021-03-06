//
//  AACell.m
//  RLZNC
//
//  Created by zcznx on 15/10/19.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "AACell.h"

@implementation AACell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    _iconView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 17, 20, 20)];
    _iconView.backgroundColor=[UIColor yellowColor];
    [self.contentView addSubview:_iconView];
    
    _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 17, 200, 20)];
    _nameLabel.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:_nameLabel];
    
    _open =[[UISwitch alloc]initWithFrame:CGRectMake(260, 12, 51, 31)];
    
    _open.thumbTintColor = [UIColor blueColor];
    _open.tintColor = [UIColor blackColor];
    _open.onTintColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:_open];
}
-(void)customWithModel:(AModel *)model
{
    _nameLabel.text=model.name;
}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
