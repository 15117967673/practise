//
//  SpecialVC.h
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASpecialVC.h"
#import "BSpecialVC.h"
#import "CSpecialVC.h"
#import "DSpecialVC.h"
@interface SpecialVC : UIViewController
@property(nonatomic,strong)ASpecialVC *avc;
@property(nonatomic,strong)BSpecialVC *bvc;
@property(nonatomic,strong)CSpecialVC *cvc;
@property(nonatomic,strong)DSpecialVC *dvc;
@end
