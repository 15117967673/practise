//
//  main.m
//  类别
//
//  Created by leisure on 15/4/23.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFString.h"
#import "QFString+QF.h"
#import "NSString+Reverse.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        QFString * qfStr1=[[QFString alloc] init];
        //调用的类别方法
        [qfStr1 addObject:@""];
        
        NSString * srcStr=@"abcdefg";
        NSLog(@"原串:%@,逆序后:%@",srcStr,[srcStr reverse]);
    }
    return 0;
}









