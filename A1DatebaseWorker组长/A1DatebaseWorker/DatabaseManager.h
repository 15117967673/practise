//
//  DatabaseManager.h
//  A1DatebaseWorker
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentModel.h"

@interface DatabaseManager : NSObject

+ (instancetype)defauleManager;

- (void)insertDataWithModel:(StudentModel *)model;

- (BOOL)selectWithModelpage:(int)page;

- (NSArray *)selectAllModelWithModelPage:(int)page;

@end
