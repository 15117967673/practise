//
//  ControlModel.h
//  smartHome
//
//  Created by zcznx on 15/10/28.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControlModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)BOOL isOn;
@end
