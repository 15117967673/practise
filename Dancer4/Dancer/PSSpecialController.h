//
//  PSSpecialController.h
//  Dancer
//
//  Created by qianfeng on 15/8/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecialModel.h"
@protocol PSSpecialControllerDelegete <NSObject>

-(void)modelValue:(SpecialModel *)model;

@end
@interface PSSpecialController : UIViewController


@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic,strong)NSString *strUrl;

@property(nonatomic,assign)id<PSSpecialControllerDelegete>delegate;

@end
