//
//  QFTest.m
//  继承与多态
//
//  Created by leisure on 15/4/22.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "QFTest.h"
#import "Animal.h"
#import "Cat.h"
#import "Dog.h"
#import "Person.h"
@implementation QFTest

+(void)test
{
    //创建一个猫对象
    Cat * cat1=[[Cat alloc] init];
    //创建一个狗对象
    Dog * dog1=[[Dog alloc] init];
    
    //声明一个动物类变量
    Animal * anyAnimal=nil;
    
    //子类的对象可以传给父类类型的变量，相当于隐藏了子类自己特有的行为
    anyAnimal=cat1;
    
    [anyAnimal eat];
    [anyAnimal run];
    //[anyAnimal eatMouse];
    
    anyAnimal=dog1;
    
    [anyAnimal eat];
    [anyAnimal run];
    
    //创建一个动物类对象
    anyAnimal=[[Animal alloc] init];
    //将父类对象传给子类类型的变量（不允许，除非明确知道）
    cat1=(Cat*)anyAnimal;
    //[cat1 eatMouse];程序会异常
    //将狗强转成猫
    cat1=(Cat*)dog1;
    [cat1 eat];
    [cat1 run];
    
    //创建一个id变量
    id  anyObject;
    //创建一个人对象
    Person * person1=[[Person alloc] init];
    //传给id变量
    anyObject=person1;
    [anyObject eat];
    [anyObject run];
    //传给id变量
    anyObject=cat1;
    [anyObject eat];
   // [anyObject eatMouse];
    
}
@end







