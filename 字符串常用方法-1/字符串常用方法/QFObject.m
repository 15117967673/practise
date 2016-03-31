//
//  QFObject.m
//  字符串常用方法
//
//  Created by leisure on 15/4/22.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "QFObject.h"

@implementation QFObject

+(void)stringTest
{
    //创建一个字符串对象 前两种为最常用方法
    NSString * str1=@"北京";
    NSString * str2=[NSString stringWithFormat:@"天津%@",@"是我家"];
    NSString * str3=[[NSString alloc] initWithFormat:@"我爱:%@",@"上海"];
    NSString * str4=[NSString stringWithString:str1];
    
    NSLog(@"%@,%@,%@,%@",str1,str2,str3,str4);
    
    //字符串拼接(此方法并没有修改字符串，是产生了一个新的字符串)
    NSString * str5=[str1 stringByAppendingString:@"是我家"];
    NSLog(@"str5:%@",str5);
    //格式化拼接
    NSString * str6=[str1 stringByAppendingFormat:@"%@,%@",@"ios培训最火",@"为什么呢？"];
    NSLog(@"str6:%@",str6);
    //字符串长度(中文，英文字母，字符，数字每一个都占一个长度)
    NSUInteger length=[str6 length];
    NSLog(@"str6长度:%ld",length);
    
    //遍历字符串，获得到每一个字符
    for(int i=0;i<length;i++){
        NSString * charStr=[NSString stringWithFormat:@"%c",[str6 characterAtIndex:i]];
        NSLog(@"str6 第%d个字符是:%@",i,charStr);
    }
    //字符串拆分成数组
    NSString * str7=@"Oc,C++,Java:PHP,Perl";
    //以逗号为分隔符将字符串拆分成数组
    NSArray * str7Array=[str7 componentsSeparatedByString:@","];
    //系统的类对象都可以使用%@来打印,因为系统的类都有一个方法description
    NSLog(@"str7Array:%@",str7Array);
    
    //用指定的字符串创建分隔字符集
    NSCharacterSet * cSet=[NSCharacterSet characterSetWithCharactersInString:@",:"];
    //用指定的分隔字符集将字符串拆成数组
    NSArray * str7Array2=[str7 componentsSeparatedByCharactersInSet:cSet];
    NSLog(@"str7Array2:%@",str7Array2);
    
    //截取子串
    //从字符串开始截取到指定位置
    NSString * str8=[str7 substringToIndex:3];
    //从指定位置截取字符串结尾
    NSString * str9=[str7 substringFromIndex:3];
    NSLog(@"str8:%@---str9:%@",str8,str9);
    //截取指定范围内的子串
    //从位置3开始，长度是5
    NSRange range=NSMakeRange(3, 5);
    NSString * str10=[str7 substringWithRange:range];
    NSLog(@"str10:%@",str10);
    
    //查找子串
    //从str7中查找字符串Java
    range=[str7 rangeOfString:@"Java"];
    if (range.location!=NSNotFound) {
        NSLog(@"str7 包含 字符串 Java");
    }
    else{
        NSLog(@"str7 不包含 字符串 Java");
    }
    //条件查找
    //此示例为不分大小写的在整个字符串中查找java子串
    range=[str7 rangeOfString:@"java" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [str7 length])];
    if (range.location!=NSNotFound) {
        NSLog(@"str7 包含 字符串 java");
    }
    else{
        NSLog(@"str7 不包含 字符串 java");
    }
    //替换
    //将整个字符串用的指定子串全部用指定的其它字符串代替
    NSString * str11=[str7 stringByReplacingOccurrencesOfString:@"Java" withString:@"java"];
    NSLog(@"str11:%@",str11);
    //将指定范围的子串全部用指定的字符串代替
    NSString * str12=[str7 stringByReplacingCharactersInRange:NSMakeRange(7, 10) withString:@"JAVA"];
    NSLog(@"str12:%@",str12);
    
    //将字符串转成小写
    NSString * lowerStr7=[str7 lowercaseString];
    NSLog(@"lower str7:%@",lowerStr7);
    //将字符串转换成大写
    NSString * upperStr7=[str7 uppercaseString];
    NSLog(@"upper str7:%@",upperStr7);
    
    //将字符串的内容写入到指定的文件中
    //第一个参数是文件的全路径
    //第二个参数是否有写缓存
    //第三个参数是字符编码方式
    //第四个参数是出错原因
    [str7 writeToFile:@"/Users/leisure/Desktop/1512/day3/str7.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //将oc字符串转换成c的字符串
    const char * cstr=[str7 UTF8String];
    NSLog(@"c 字符串 :%s", cstr);
    
    //将指定的网址转换成NSURL类型对象
    NSURL * httpUrl=[NSURL URLWithString:@"http://www.baidu.com"];
    //用指定的网址的内容创建字符串
    NSString * urlStr=[NSString stringWithContentsOfURL:httpUrl encoding:NSUTF8StringEncoding error:nil];
    [urlStr writeToFile:@"/Users/leisure/Desktop/1512/day3/baidu.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


+(void)mutableStringTest
{
    
}
@end








