//
//  Dog.m
//  继承与多态
//
//  Created by leisure on 15/4/22.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)eat
{
    [super eat];
    
    NSLog(@"狗喜欢吃骨头");
}
-(void)run
{
    NSLog(@"狗每小时可以跑 25公里");
}
@end






