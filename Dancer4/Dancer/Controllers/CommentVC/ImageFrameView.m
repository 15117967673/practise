//
//  ImageFrameView.m
//  Dancer
//
//  Created by qianfeng on 15/9/3.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ImageFrameView.h"
#import "CommentModel.h"
#import "UIImageView+AFNetworking.h"
@implementation ImageFrameView
- (void)awakeFromNib
{
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i=0; i<4; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:imageView];
        imageView.backgroundColor=[UIColor whiteColor];
        [array addObject:imageView];
    }
    
    self.imageViewArray = array;
    //self.backgroundColor = [UIColor clearColor];
}

+ (float) contentHeightWithImages: (NSArray *)imageArray withinWidth: (float) width
{
    if (imageArray.count==0) {
        return 0;
    }
    else if (imageArray.count<=2) {
        return 120;
    }
    else return width / 4 - 5;
}

- (void) setImageArray: (NSArray *)imageArray withinWidth: (float)width
{
    NSInteger imageCount = imageArray.count;
//    if (imageCount==0) {
//        return;
//    }
    //返回一个cell中每个imageview的宽度
    float imageSize = [ImageFrameView contentHeightWithImages:imageArray withinWidth:width];
    
    float x = 0;
    
    for (NSInteger i=0; i<self.imageViewArray.count; i++) {
        UIImageView * imageView = self.imageViewArray[i];
        
        if (i<imageCount) {
          

            imageView.frame = CGRectMake(x, 0, imageSize, imageSize);
        
            [imageView setImageWithURL:[NSURL URLWithString:imageArray[i]] placeholderImage:[UIImage imageNamed:@"metro_topic_loading.9"]];
        }
        
        x += imageSize + 5;
        
       imageView.hidden = i>=imageCount;
//        if(i>=imageCount){
//            [imageView removeFromSuperview];
//        }
    }
    
}

@end
