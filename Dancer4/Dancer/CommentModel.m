//
//  CommentModel.m
//  Dancer
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
-(instancetype)init
{
    if (self=[super init]) {
        _imageArr=[[NSMutableArray alloc]init];
    }
    return self;
}
@end
