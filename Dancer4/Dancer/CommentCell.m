//
//  CommentCell.m
//  Dancer
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CommentCell.h"
#import "UIImageView+AFNetworking.h"
#import "UIViewAdditions.h"
#import "NSString+Frame.h"
@interface CommentCell ()
{
    float contentHeight;
    
    CGSize size;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ImageFrameViewHeightConstrait;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@end
@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
    _iconImage.layer.borderWidth=1;
    _iconImage.layer.borderColor=[[UIColor blackColor]CGColor];
    _iconImage.layer.cornerRadius=10;
    _iconImage.clipsToBounds=YES;
}
-(void)setModel:(CommentModel *)model
{
    
    float contentWidth = self.contentView.frame.size.width  - 20;
    [_iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",model.host,model.dir,model.filepath,model.filename]]placeholderImage:[UIImage imageNamed:@"metro_topic_loading.9"]] ;
    _nameLabel.text=model.memberName;
    NSRange range=[model.content rangeOfString:@"<div"];
    if(range.location!=NSNotFound){
        NSString *str=[model.content substringToIndex:range.location];
        _content.text=str;
        if([_content.text isEqualToString:@""]){
            contentHeight=floor(0.0);
            self.contentLabelWidthConstraint.constant = contentHeight;
        }else{
            
            contentHeight = [_content.text heightWithFont:_content.font withinWidth:contentWidth];
            self.contentLabelWidthConstraint.constant = contentHeight;
        }

    }else{
        _content.text=model.content;
        if([_content.text isEqualToString:@""]){
            contentHeight=floor(0.0);
            self.contentLabelWidthConstraint.constant = contentHeight;
        }else{
            
            contentHeight = [_content.text heightWithFont:_content.font withinWidth:contentWidth];
            self.contentLabelWidthConstraint.constant = contentHeight;
        }

    }

    _createTime.text=model.createTime;
    _commentCount.text=[NSString stringWithFormat:@"赞:%@",model.commentNum];
    
    [self.imageFrameView setImageArray:model.imageArr withinWidth:contentWidth];
    self.ImageFrameViewHeightConstrait.constant = [ImageFrameView contentHeightWithImages:model.imageArr withinWidth:contentWidth];
   // float contentHeight = [model.content heightWithFont:_content.font withinWidth:contentWidth];
 
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
