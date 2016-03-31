//
//  UserModel.h
//  UserList
//
//  Created by leisure on 15/5/6.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
//用户id
@property (nonatomic,copy) NSString * uid;
//用户名
@property (nonatomic,copy) NSString * username;
//头像地址
@property (nonatomic,copy) NSString * headimage;

//测试方法
+(void)test;
@end











