//
//  ImageFrameView.h
//  Dancer
//
//  Created by qianfeng on 15/9/3.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageFrameView : UIView
@property (nonatomic) NSArray * imageViewArray;

+ (float) contentHeightWithImages: (NSArray *)imageArray withinWidth: (float) width;

- (void) setImageArray: (NSArray *)imageArray withinWidth: (float)width;
@end
