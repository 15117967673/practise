//
//  PSSpecialCell.m
//  Dancer
//
//  Created by qianfeng on 15/8/30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PSSpecialCell.h"
#import "UIImageView+AFNetworking.h"
#import "PSSpecialCell.h"
#import "UIViewAdditions.h"

@implementation PSSpecialCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if(self){
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,150*(SCREENW/320), 0)];
        //self.imageView.clipsToBounds = YES;

        [self addSubview:self.imageView];
        self.captionLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150*(SCREENW/320), 10)];
        self.captionLabel.numberOfLines=0;
        [self addSubview:self.captionLabel];
        self.captionLabel.backgroundColor=[UIColor clearColor];
        self.captionLabel.font=[UIFont systemFontOfSize:14];
    }
    return self;
}
- (void)prepareForReuse {
    [super prepareForReuse];

}
 //图片 文字 frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat scaledHeight = floorf((self.object.height.floatValue / (self.object.width.floatValue / width)));
    
    CGRect frame=self.imageView.frame;
    frame.size.height=scaledHeight;
    self.imageView.frame=frame;
    
    CGSize size=[self.object.title boundingRectWithSize:CGSizeMake(150*(SCREENW/320), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:self.captionLabel.font forKey:NSFontAttributeName] context:nil].size;
    
    CGRect bodyframe=self.captionLabel.frame;
    bodyframe.size.height=size.height;
    self.captionLabel.frame=bodyframe;
    
    CGRect frameLabel=self.captionLabel.frame;
    frameLabel.origin.y=self.imageView.frame.size.height;
    self.captionLabel.frame=frameLabel;

}
//填充cell内容
- (void)fillViewWithObject:(SpecialModel *)object
{
    [super fillViewWithObject:object];

    [self.imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",object.host,object.dir,object.filepath,object.filename]]];
    self.captionLabel.text=object.title;

}
//cell大小
+ (CGFloat)heightForViewWithObject:(SpecialModel *)object inColumnWidth:(CGFloat)columnWidth  {

    CGFloat cellImageHeight = floorf((object.height.floatValue / (object.width.floatValue / 150)));
    
    CGFloat height=[object.title boundingRectWithSize:CGSizeMake(150*(SCREENW/320), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName ]  context:nil].size.height;
    CGFloat Height = floorf((height+cellImageHeight)*(SCREENW/320));
    return Height;
    
}
@end
