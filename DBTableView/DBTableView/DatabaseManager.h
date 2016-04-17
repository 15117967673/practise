//
//  DatabaseManager.h
//  DBTableView
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"


@interface DatabaseManager : NSObject

//单例对象
+ (instancetype)defaultManager;

//插入数据
- (void)insertDataWithModel:(Model *)pm;

//修改
- (void)updateDataWithModel:(Model *)pm forId:(int)pId;

//查询
- (NSArray *)selectAllModel:(NSInteger)a;

@end
