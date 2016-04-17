//
//  Student.h
//  A1CoreData
//
//  Created by Mac on 15-8-12.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;

@end
