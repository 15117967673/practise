//
//  QFObject.m
//  字典常用方法
//
//  Created by leisure on 15/4/24.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "QFObject.h"

@implementation QFObject

+(void)dictionaryTest
{
    //用指定的多个键值对对象来创建一个字典
    //value在前key在后，成对列出
    NSDictionary * dict1=[NSDictionary dictionaryWithObjectsAndKeys:@"a",@"key1",@"b",@"key2",@"c",@"key3", nil];
    
    //获得字典的所有key,返回值为数组
    NSArray * keysArray=[dict1 allKeys];
    
    for(NSString * key in keysArray) {
        //根据key(键)获得对应的value(值)
        NSString * value=[dict1 objectForKey:key];
        
                          //[dict1 valueForKey:key];
        NSLog(@"dict1 value:%@",value);
    }
    //获得字典的所有value(值)，返回值为数组
    NSArray * valuesArray=[dict1 allValues];
    NSLog(@"valusesArray:%@",valuesArray);
    
    //创建空的可变字典
    NSMutableDictionary * mutableDict=[[NSMutableDictionary alloc] init];
    //用指定的健值对创建一个可变字典
    mutableDict=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"a",@"key1",@"b",@"key2",@"c",@"key3", nil];
    NSLog(@"mutableDict:%@",mutableDict);
    
    //给可变字典添加元素（一对键值对）
    [mutableDict setObject:@"d" forKey:@"key4"];
    //从可变字典中删除一个元素（一对键值对）
    [mutableDict removeObjectForKey:@"key4"];
    //删除字典的所有元素（清空）
    [mutableDict removeAllObjects];
    //将另一个字典的所有元素加入
    [mutableDict addEntriesFromDictionary:dict1];
    NSLog(@"mutableDict:%@",mutableDict);
    
    NSArray * keys=[mutableDict allKeysForObject:@"a"];
    
}
@end











