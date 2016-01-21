//
//  RecommendModel.h
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendModel : NSObject
@property(nonatomic,copy)NSString *host;
@property(nonatomic,copy)NSString *dir;
@property(nonatomic,copy)NSString *filepath;
@property(nonatomic,copy)NSString *filename;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *clickNum;
@property(nonatomic,copy)NSString *contentUrl;
@property(nonatomic,copy)NSMutableArray *childsData;
@property(nonatomic,copy)NSNumber *Id;
-(instancetype)init;
@end
