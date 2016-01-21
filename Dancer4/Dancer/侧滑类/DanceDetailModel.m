//
//  DanceDetailModel.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DanceDetailModel.h"

@implementation DanceDetailModel
-(instancetype)init
{
    if(self=[super init]) {
        _childsData=[[NSMutableArray alloc]init];
    }
    return self;
}
@end
