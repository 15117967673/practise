//
//  UserModel.m
//  UserList
//
//  Created by leisure on 15/5/6.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+(void)test
{
    //创建保存所有用户信息的数组
    NSMutableArray * userArray=[[NSMutableArray alloc] init];
    NSFileManager * fm=[NSFileManager defaultManager];
    //获得本地文件指定目录的文件个数
    //因为每次获得20个文件，所以某一次请求的页码就是文件总数除以20的商,页码最小值为1
    NSInteger pageNumber=[[fm contentsOfDirectoryAtPath:@"/Users/leisure/Desktop/1512/day12/" error:nil] count]/20+1;
        //内网的sns用户信息的地址
    NSString * url=[NSString stringWithFormat:@"http://10.0.8.8/sns/my/user_list.php?number=20&page=%ld",pageNumber];
    //将字符串转换成网址类的对象
    NSURL * newUrl=[NSURL URLWithString:url];
    //获得指定网址的二进制数据
    NSData * data=[NSData dataWithContentsOfURL:newUrl];
    //使用系统的json解析器将二进制数据解析成json对象（数缓或字典等）
    NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    //对字典中的所有用户信息的数组进行遍历,获得到每一个用户信息的字典
    
    for (NSDictionary * userDict in [dict objectForKey:@"users"]) {
        //创建保存用户信息的模型对象
        UserModel * model=[[UserModel alloc] init];
        //将字典中的键值对保存到模型的属性中
        model.uid=[userDict objectForKey:@"uid"];
        model.username=[userDict objectForKey:@"username"];
        model.headimage=[NSString stringWithFormat:@"http://10.0.8.8/sns%@",[userDict objectForKey:@"headimage"]];
        //保存解析后的用户模型对象
        [userArray addObject:model];
        
        //要保存的头象在本地的全路径
        NSString * fullPath=[NSString stringWithFormat:@"/Users/leisure/Desktop/1512/day12/%@.png",model.username];
        //从远程的图片地址获得图片的二进制数据
        NSData * imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:model.headimage]];
        //将图片写入本地文件中
        [imageData writeToFile:fullPath atomically:YES];
    }
    //打印所有用户的信息
    [userArray makeObjectsPerformSelector:@selector(print)];
}
-(void)print
{
    NSLog(@"username=%@,headimage=%@",self.username,self.headimage);
}
@end









