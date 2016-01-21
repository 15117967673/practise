//
//  CSpecialVC.h
//  Dancer
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSSpecialController.h"
#import "SpecialModel.h"
@protocol CSpecialVCDelegate <NSObject>

-(void)modelValue:(SpecialModel *)model;

@end
@interface CSpecialVC : UIViewController
@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic,strong)NSString *strUrl;
@property(nonatomic,assign)id<CSpecialVCDelegate>delegate;

@end
