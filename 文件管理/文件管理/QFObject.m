//
//  QFObject.m
//  文件管理
//
//  Created by leisure on 15/4/29.
//  Copyright (c) 2015年 leisure. All rights reserved.
//

#import "QFObject.h"

@implementation QFObject
//演示文件管理类的使用
+(void)test
{
    //获得一个文件管理类的对象
    NSFileManager * fm=[NSFileManager defaultManager];
    //操作的路径
    NSString * path=@"/Users/leisure/Desktop/1512/day8";
    //获得路径下的内容
    NSArray * array=[fm contentsOfDirectoryAtPath:path error:nil];
    for(NSString * name in array){
        NSLog(@"name:%@",name);
        //路径拼接的方法 ，自动添加 /
        NSString * subPath=[path stringByAppendingPathComponent:name];
        BOOL isDirectory;
        //检查指定的路径是否存在，同时它是文件还是文件夹
        BOOL isExists=[fm fileExistsAtPath:subPath isDirectory:&isDirectory];
        
        if(isExists){
            if (isDirectory) {
                NSLog(@"文件夹存在:%@",subPath);
            }
            else{
                NSLog(@"文件存在:%@",subPath);
            }
            NSDictionary * dict=[fm attributesOfItemAtPath:subPath error:nil];
            //打印文件或文件夹的所有属性
            NSLog(@"attr dict:%@",dict);
            //获得文件大小
            unsigned long long fileSize=[[dict objectForKey:NSFileSize] longLongValue];
            NSLog(@"file size:%lld",fileSize);
        }
        else{
            NSLog(@"路径不存在:%@",subPath);
        }
    }
    
    //检查指定的路径是否存在
    if ([fm fileExistsAtPath:@"/Users/leisure/Desktop/1512/day9"]) {
        NSLog(@"路径%@存在",@"/Users/leisure/Desktop/1512/day9");
    }
    else{
        NSLog(@"路径%@不存在",@"/Users/leisure/Desktop/1512/day9");
    }
    //创建指定的路径
    //第一个参数为要创建的路径
    //第二个参数为，如果父路径不存在是否创建
    //第三个参数 如果创建失败，用来保存失败原因
    BOOL success=[fm createDirectoryAtPath:@"/Users/leisure/Desktop/1512/day10" withIntermediateDirectories:YES attributes:nil error:nil];
    if (success) {
        NSString * info=@"轻轻的我走了,没有带走一行代码";
        //将字符串转换成二进制
        NSData * data=[info dataUsingEncoding:NSUTF8StringEncoding];
        
        //在指定的目录下创建一个文件
        //第一个参数为要创建的文件全路径
        //第二个参数为文件内容
        //第三个参数为文件属性
        success=[fm createFileAtPath:@"/Users/leisure/Desktop/1512/day9/info.txt" contents:data attributes:nil];
    }
    //拷贝文件夹(目标路径应该不存在)
    NSError * error;
    success=[fm copyItemAtPath:@"/Users/leisure/Desktop/1512/day9" toPath:@"/Users/leisure/Desktop/1512/day11/" error:&error];
    if (!success) {
        NSLog(@"error:%@",error);
    }
    //拷贝文件
    success=[fm copyItemAtPath:@"/Users/leisure/Desktop/1512/day9/info.txt" toPath:@"/Users/leisure/Desktop/1512/day10/test.txt" error:&error];
    if (!success) {
        NSLog(@"error:%@",error);
    }
    //删除文件或文件夹
    success=[fm removeItemAtPath:@"/Users/leisure/Desktop/1512/day11/" error:nil];
    if (!success) {
        NSLog(@"error:%@",error);
    }
    //移动文件或文件夹
    success=[fm moveItemAtPath:@"/Users/leisure/Desktop/1512/day10/test.txt" toPath:@"/Users/leisure/Desktop/1512/day9/test1.txt" error:&error];
    //深度遍历指定的路径
    NSArray * allContents=[fm subpathsAtPath:@"/Users/leisure/Desktop/1512/"];
    for (NSString * path in allContents) {
        NSLog(@"path:%@",path);
    }
    
    //fopen(<#const char *restrict#>, <#const char *restrict#>)
    //fwrite(<#const void *restrict#>, <#size_t#>, <#size_t#>,<#FILE *restrict#>)
    //用读取的文件创建指定文件句柄(NSFileHandle对象)
    NSFileHandle * fh=[NSFileHandle fileHandleForReadingAtPath:@"/Users/leisure/Desktop/1512/day8/文件管理/文件管理/QFObject.m"];
    //读取文件的全部内容
    NSData * data=[fh readDataToEndOfFile];
    //移动文件指针到文件结尾
    //[fh seekToEndOfFile]
    //读取指定字节的内容
    data=[fh readDataOfLength:1024];
    
    //将data转换成字符串
    NSString * content=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"content:%@",content);
}
@end