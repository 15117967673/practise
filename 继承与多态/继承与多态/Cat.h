//
//  Cat.h
//  继承与多态
//
//  Created by leisure on 15/4/22.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
@interface Cat : Animal
{
    //猫的颜色
    NSString * _color;
}
@property (nonatomic,assign) BOOL sex;

//猫吃老鼠
-(void)eatMouse;
@end













