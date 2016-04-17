//
//  Model.h
//  DBTableView
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic,copy)NSString *headimage;
@property(nonatomic,copy)NSNumber *lastactivity;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,assign)NSInteger page;
@end
