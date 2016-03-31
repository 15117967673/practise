//
//  NSString+Reverse.m
//  类别
//
//  Created by leisure on 15/4/23.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "NSString+Reverse.h"

@implementation NSString (Reverse)

-(NSString*)reverse
{
    NSString * destStr=@"";
    
    //反向遍历当前字符串
    for (NSInteger i=[self length]-1;i>=0;i--) {
        
        //将每一个字符拼接成新串
        destStr=[destStr stringByAppendingFormat:@"%c",[self characterAtIndex:i]];
    }
    //返回
    return destStr;
}
@end









