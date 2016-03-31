//
//  Animal.h
//  继承与多态
//
//  Created by leisure on 15/4/22.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    //私有修饰符，修饰的变量只能在当前类中使用，修饰符的作用范围为遇到下一个修饰符停止
    @private
    //年龄
    int _age;
    //保护修饰符，修饰的变量可以在当前类及它的子类中使用
    @protected
    int _weight;
    //公有修饰符，修饰的变量可以在所有类中使用
    @public
    NSArray * _childArray;
}
//动物的名字
@property (nonatomic,copy) NSString * name;
//吃东西
-(void)eat;
//跑
-(void)run;
@end
