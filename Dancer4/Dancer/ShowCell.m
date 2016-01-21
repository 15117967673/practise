//
//  ShowCell.m
//  Dancer
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ShowCell.h"
#import "UIImageView+AFNetworking.h"
#import "UIViewAdditions.h"
#import "NSString+Frame.h"
@interface ShowCell ()
{

}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLableHeightConstraint;
@end
@implementation ShowCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)customModel:(ShowModel *)model
{
    _titleLabel.text=model.title;
    
    _keywordsLabel.text=model.keywords;
    
    [_backImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.host,model.dir,model.filepath,model.filename]] placeholderImage:[UIImage imageNamed:@"metro_topic_loading.9"]] ;
    
    float contentWith=SCREENW-20;
    _titleLableHeightConstraint.constant=[_titleLabel.text heightWithFont:_titleLabel.font withinWidth:contentWith];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
