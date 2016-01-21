//
//  DanceDetailCellAnother.m
//  Dancer
//
//  Created by qianfeng on 15/8/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DanceDetailCellAnother.h"
#import "UIImageView+AFNetworking.h"
@implementation DanceDetailCellAnother

- (void)awakeFromNib {
    // Initialization code
}
-(void)customModel:(DanceDetailModel *)model
{
    _smallLabel.text=model.title;
    _clickNum.text=[NSString stringWithFormat:@"%@在学",model.clickNum];
    _clickNum.layer.borderWidth=1;
    _clickNum.layer.borderColor=[[UIColor redColor]CGColor];
    [_smallImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.host,model.dir,model.filepath,model.filename]]placeholderImage:[UIImage imageNamed:@"metro_topic_loading.9"]] ;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
