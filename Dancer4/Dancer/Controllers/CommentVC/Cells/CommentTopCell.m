//
//  CommentTopCell.m
//  Dancer
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CommentTopCell.h"
#import "UIImageView+AFNetworking.h"
@implementation CommentTopCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)customModel:(CommentModel *)model
{
    [_iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.iconHost,model.iconDir,model.iconFillPath,model.iconFilename]]];
    [_backImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.backHost,model.backDir,model.backFillPath,model.backFilename]]placeholderImage:[UIImage imageNamed:@"metro_topic_loading.9"]] ;
    _topicCounhtLabel.text=model.topicCount;
    _titleLabel.text=model.topTitle;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
