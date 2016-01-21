//
//  RecommendModel.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel
-(instancetype)init
{
    if(self=[super init]) {
        _childsData=[[NSMutableArray alloc]init];
    }
    return self;
}

@end
