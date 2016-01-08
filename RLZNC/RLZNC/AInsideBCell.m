//
//  AInsideBCell.m
//  RLZNC
//
//  Created by zcznx on 15/10/20.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "AInsideBCell.h"

@implementation AInsideBCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    _time=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 20, 20)];
    _time.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:_time];
    _time.backgroundColor=[UIColor yellowColor];
    
    _day=[[UILabel alloc]initWithFrame:CGRectMake(5, 27, 20, 20)];
    _day.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:_day];
    _day.backgroundColor=[UIColor yellowColor];
    
    _isOn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_isOn setBackgroundColor:[UIColor yellowColor]];
    [_isOn setFrame:CGRectMake(240, 5, 30, 20)];
    [self.contentView addSubview:_isOn];
    
    
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
