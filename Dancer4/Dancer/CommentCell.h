//
//  CommentCell.h
//  Dancer
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
#import "CommentBasicCell.h"
#import "ImageFrameView.h"
@interface CommentCell : CommentBasicCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createTime;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet ImageFrameView *imageFrameView;

@property(nonatomic,copy)CommentModel *model;
@end
