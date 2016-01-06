//
//  DanceDetailCell.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DanceDetailCell.h"
#import "UIImageView+AFNetworking.h"
@implementation DanceDetailCell

- (void)awakeFromNib {
    // Initialization code
    
}
-(void)customModel:(DanceDetailModel *)model
{
    _nameLabel.text=model.title;
    _clickNum.text=[NSString stringWithFormat:@"%@人在学",model.clickNum];
    _clickNum.layer.borderWidth=1;
    _clickNum.layer.borderColor=[[UIColor redColor]CGColor];
    //[_image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.host,model.dir,model.filepath,model.filename] ]] ;
    [_image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.host,model.dir,model.filepath,model.filename] ] placeholderImage:[UIImage imageNamed:@"metro_topic_loading.9"]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
