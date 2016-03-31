//
//  QFObject.m
//  数组常用方法
//
//  Created by leisure on 15/4/23.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "QFObject.h"

@implementation QFObject

+(void)arrayTest
{
    //创建数组
    //用指定的多个元素创建一个不可变数组
    NSArray * array=[[NSArray alloc] initWithObjects:@"a",@"b",@"c", nil];
    //类方法
    array=[NSArray arrayWithObjects:@"a",@"b",@"c", nil];
    //遍历数组
    //第一种方法
    for (int i=0;i<[array count];i++) {
        NSString * str=[array objectAtIndex:i];
        //c语言数组方式使用
        NSString * str1=array[i];
        NSLog(@"str:%@,%@",str,str1);
    }
    //第二种方法(快速枚举)
    for(NSString * str in array){
        NSLog(@"str:%@",str);
    }
    
    //截取子数组
    NSArray * subArray=[array subarrayWithRange:NSMakeRange(1, 1)];
    for(NSString * str in subArray){
        NSLog(@"subArray:str:%@",str);
    }
    //添加一个新元素
    NSArray * newArray=[array arrayByAddingObject:@"d"];
    for(NSString * str in newArray){
        NSLog(@"newArray:%@",str);
    }
    //数组中是否包含指定的对象
    if([newArray containsObject:@"d"]){
        NSLog(@"newArray包含:d");
    }
    else{
        NSLog(@"newArray不包含:d");
    }
    
    //创建可变数组
    NSMutableArray * mutableArray=[NSMutableArray array];
    //实例方法创建新可变数组
    mutableArray=[[NSMutableArray alloc] initWithCapacity:0];
    //添加一个新元素
    [mutableArray addObject:@"a"];
    //给可变数组添加newArray中的所有元素
    [mutableArray addObjectsFromArray:newArray];
    
    NSLog(@"mutableArray:%@",mutableArray);
    
    //删除元素
    //删除所有
    //[mutableArray removeAllObjects];
    //删除最后一个
    [mutableArray removeLastObject];
    //删除指定
    [mutableArray removeObject:@"b"];
    //删除第0个
    [mutableArray removeObjectAtIndex:0];
    //从指定范围内容删除指定对象
    [mutableArray removeObject:@"a" inRange:NSMakeRange(0, [mutableArray count])];
    
    //替换第0个位置元素
    [mutableArray replaceObjectAtIndex:0 withObject:@"aa"];
    NSLog(@"mutableArray:%@",mutableArray);
    //用指定的数组中的所有元素替换原数组指定范围内的元素，
    [mutableArray replaceObjectsInRange:NSMakeRange(0, 1) withObjectsFromArray:newArray];
    NSLog(@"mutableArray:%@",mutableArray);
    //用指定的分隔符将数组的所有元素拼成字符串
    NSString * arrayStr=[mutableArray componentsJoinedByString:@"**"];
    NSLog(@"arrayStr:%@",arrayStr);
    
    
}
@end













