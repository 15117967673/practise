//
//  DatabaseManager.m
//  DBTableView
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "DatabaseManager.h"
#import "FMDatabase.h"
@interface DatabaseManager ()

{
    //用来操作数据库
    FMDatabase *_fmdb;
    
    //线程锁
    NSLock *_lock;
}

@end

@implementation DatabaseManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _lock = [[NSLock alloc] init];
        
        //将要管理的数据库的路径
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/48.db"];
        
        //使用一个数据库来路径初始化fmdb（专门管理数据库的）
        _fmdb = [[FMDatabase alloc] initWithPath:path];
        
        //打开数据库（如果数据库存在就直接打开，否则就先创建再打开）
        BOOL isOpen = [_fmdb open];
        
        if (isOpen) {
            /*
             *  创建表的sql语句
             *  前5个单词是固定的，如果表不存在就创建，存在就不作任何操作
             *  userInfo()表，表名可以自定义
             *  表名后面的小括号里放的就是字段信息，任意2个字段之间用逗号隔开
             *  字段信息中，第一个单词是字段名（可以自定义）
             *  第二个单词是字段的数据类型（按需设置）
             *  primary key主键   autoincrement主键自动增长
             *  default 0如果不赋值，默认就是0
             */
            NSString *createSql = @"create table if not exists userInfo(serial integer primary key autoincrement,uid varchar(256),username varchar(256),headimage varchar(256),lastactiveity varchar(256))";
            
            //执行更新操作（增删改都属于更新）
            BOOL isCreate = [_fmdb executeUpdate:createSql];
            
            if (!isCreate) {
                NSLog(@"%@",_fmdb.lastErrorMessage);
            }
        }
    }
    return self;
}

+ (instancetype)defaultManager
{
    static DatabaseManager *dm = nil;
    @synchronized(self){
        if (!dm) {
            dm = [[DatabaseManager alloc] init];
        }
    }
    return dm;
}

- (void)insertDataWithModel:(Model *)pm
{
    [_lock lock];
    
    NSString *insertSql = @"insert into userInfo(uid,username,headimage,lastactiveity) values(?,?,?,?)";
    
    BOOL isInsert = [_fmdb executeUpdate:insertSql,pm.uid,pm.username,pm.headimage,pm.lastactivity];
        
    
    if (!isInsert) {
        NSLog(@"%@",_fmdb.lastErrorMessage);
    }
    
    [_lock unlock];
}

//- (void)updateDataWithModel:(Model *)pm forId:(int)pId
//{
//    [_lock lock];
//    
//    NSString *updateSql = @"update userInfo set name=?,age=?,image=? where id=?";
//    
//    BOOL isUpdate = [_fmdb executeUpdate:updateSql,pm.nameStr,pm.ageStr,pm.iconData,@(pId)];
//    
//    if (!isUpdate) {
//        NSLog(@"%@",_fmdb.lastErrorMessage);
//    }
//    
//    [_lock unlock];
//}

- (NSArray *)selectAllModel:(NSInteger)a
{
    [_lock lock];
    
    NSString *selectSql = [NSString stringWithFormat:@"select * from userInfo where serial>=%d and serial<=%d",a*4-3,a*4];
    NSLog(@"aaaaaaaaaa=%d",a);
    //执行查询的sql，用set接收
    FMResultSet *set = [_fmdb executeQuery:selectSql];
    
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    //遍历查询结果
    while ([set next]) {
        //set会依次代表所有的数据
        Model *pm = [[Model alloc] init];
        pm.uid = [set stringForColumn:@"uid"];
        pm.username = [set stringForColumn:@"username"];
        pm.headimage = [set stringForColumn:@"headimage"];
        pm.lastactivity=@([[set stringForColumn:@"lastactivity"]intValue]);
        
        [tmpArr addObject:pm];
    }
    [_lock unlock];
    
    return tmpArr;
}

@end

