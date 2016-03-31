//
//  Cat.m
//  继承与多态
//
//  Created by leisure on 15/4/22.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "Cat.h"

@implementation Cat

-(instancetype)init
{
    if (self=[super init]) {
        _color=@"白色";
    }
    return self;
}
//重写父类的方法
-(void)eat
{
    //调用父类的同名方法
    [super eat];
    //自己的实现
    NSLog(@"猫喜欢吃鱼");
}

-(void)run
{
    NSLog(@"猫每小时跑 15公里");
}

-(void)eatMouse
{
    NSLog(@"喜欢吃老鼠的猫不是好猫");
}
@end







