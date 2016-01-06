//
//  TopModel.h
//  Dancer
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject
@property(nonatomic,copy)NSString *iconHost;
@property(nonatomic,copy)NSString *iconDir;
@property(nonatomic,copy)NSString *iconFillPath;
@property(nonatomic,copy)NSString *iconFilename;
@property(nonatomic,copy)NSString *backHost;
@property(nonatomic,copy)NSString *backDir;
@property(nonatomic,copy)NSString *backFillPath;
@property(nonatomic,copy)NSString *backFilename;
@property(nonatomic,copy)NSString *topTitle;
@property(nonatomic,copy)NSString *topicCount;

@end
