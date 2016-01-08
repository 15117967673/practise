//
//  AInsideACell.m
//  RLZNC
//
//  Created by zcznx on 15/10/20.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "AInsideACell.h"
#import "AInsideModel.h"
@implementation AInsideACell
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
    _name=[[UILabel alloc]initWithFrame:CGRectMake(5, 17, 100, 20)];
    _name.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:_name];
    _name.backgroundColor=[UIColor yellowColor];
    
    _sw=[[UISwitch alloc]initWithFrame:CGRectMake(260, 12, 51, 31)];
    [self.contentView addSubview:_sw];
}
-(void)customWithModel:(AInsideModel *)model
{
    _name.text=model.name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
