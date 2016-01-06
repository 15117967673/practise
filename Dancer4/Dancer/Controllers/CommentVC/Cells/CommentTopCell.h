//
//  CommentTopCell.h
//  Dancer
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentBasicCell.h"
#import "CommentModel.h"
@interface CommentTopCell : CommentBasicCell
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *topicCounhtLabel;
-(void)customModel:(CommentModel *)model;
@end
