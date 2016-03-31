//
//  QFTest.m
//  Test
//
//  Created by leisure on 15/5/6.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "QFTest.h"

@implementation QFTest

//获得第i行第j列的值
+(int)string:(int)i column:(int)j
{
    if (i==0||i==1||j==0||j==i) {
        return 1;
    }
    else{
        int count=[self string:i-1 column:j-1]+[self string:i-1 column:j];
        return count;
    }
}
+(void)test
{
    for (int i=0;i<10;i++) {
        for (int j=0;j<=i;j++) {
            printf("%d ",[QFTest string:i column:j]);
        }
        printf("\n");
    }
}
@end










