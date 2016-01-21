//
//  RecommendCell.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RecommendCell.h"
#import "UIImageView+AFNetworking.h"
#import "UIViewAdditions.h"
#import "NSString+Frame.h"
@interface RecommendCell ()
{
   
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LableHeightConstraint;
@end


@implementation RecommendCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)customModel:(RecommendModel *)model
{
    _nameLabel.text=model.title;
    _clickNum.text=[NSString stringWithFormat:@"%@在学",model.clickNum];
    _clickNum.layer.borderWidth=1;
    _clickNum.layer.borderColor=[[UIColor redColor]CGColor];
    [_image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.host,model.dir,model.filepath,model.filename]]placeholderImage:[UIImage imageNamed:@"metro_topic_loading.9"]] ;
    
    float contentWith=SCREENW-20;
    _LableHeightConstraint.constant=[_nameLabel.text heightWithFont:_nameLabel.font withinWidth:contentWith];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
