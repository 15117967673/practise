//
//  AInsideDCell.m
//  RLZNC
//
//  Created by zcznx on 15/10/20.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "AInsideDCell.h"

@implementation AInsideDCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
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

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
