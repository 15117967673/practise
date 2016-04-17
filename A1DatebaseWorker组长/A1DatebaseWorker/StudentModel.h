//
//  StudentModel.h
//  A1DatebaseWorker
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic, copy) NSString *headimage;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSNumber *lastactivity;
@property (nonatomic, assign) int page;

@end
