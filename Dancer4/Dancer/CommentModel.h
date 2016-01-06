//
//  CommentModel.h
//  Dancer
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *host;
@property(nonatomic,copy)NSString *dir;
@property(nonatomic,copy)NSString *filepath;
@property(nonatomic,copy)NSString *filename;
@property(nonatomic,copy)NSString *commentNum;
@property(nonatomic,copy)NSString *memberName;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSMutableArray *imageArr;
@property(nonatomic,copy)NSString *contenImagehost;
@property(nonatomic,copy)NSString *contenImagedir;
@property(nonatomic,copy)NSString *contenImagefilepath;
@property(nonatomic,copy)NSString *contenImagefilename;



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

-(instancetype)init;
@end
