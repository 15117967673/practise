//
//  DatabaseManager.m
//  A1DatebaseWorker
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "DatabaseManager.h"
#import "FMDatabase.h"

@implementation DatabaseManager
{
    FMDatabase *_fmdb;
    NSLock *_lock;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lock = [[NSLock alloc] init];
        
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/1230.db"];
        _fmdb = [[FMDatabase alloc] initWithPath:path];
        
        BOOL isOpen = [_fmdb open];
        
        if (isOpen) {
            
            NSString *createSql = @"create table if not exists studentInfo(serial integer primary key autoincrement,uid varchar(256),username varchar(256),headimage varchar(256),lastactivity text)";
            //_fmdb执行更新操作 （增、删、改、创建，都属于更新）
            BOOL isCreate = [_fmdb executeUpdate:createSql];
            
            if (!isCreate) {
                NSLog(@"%@",_fmdb.lastErrorMessage);
            }
        }
    }
    return self;
}

+ (instancetype)defauleManager
{
    static DatabaseManager *dm = nil;
    @synchronized(self){
        
        if (!dm) {
            dm = [[DatabaseManager alloc] init];
        }
    }
    return dm;
}


- (void)insertDataWithModel:(StudentModel *)model
{
    [_lock lock];
    
    NSString *insertSql = @"insert into studentInfo(uid,username,headimage,lastactivity)values(?,?,?,?)";
    
    BOOL isInsert = [_fmdb executeUpdate:insertSql,model.uid,model.username,model.headimage,model.lastactivity];
    
    if (!isInsert) {
        NSLog(@"%@",_fmdb.lastErrorMessage);
    }
    
    [_lock unlock];
}

- (BOOL)selectWithModelpage:(int)page
{
    [_lock lock];
    NSString *select = [NSString stringWithFormat:@"select *from studentInfo where serial=%d",page];
    
    //执行查询的SQL，用set来接收(查询的所有数据都是用FMResultSet来接收的)
    FMResultSet *set = [_fmdb executeQuery:select];
    //解锁
    [_lock unlock];
    
    int i = 0;
    
    while ([set next]) {
        i++;
    }
    
    if (i == 0) {
        return NO;
    }
    return YES;
}

- (NSArray *)selectAllModelWithModelPage:(int)page
{
    [_lock lock];
    NSString *select = [NSString stringWithFormat:@"select *from studentInfo where serial>%d and serial<%d",page-5,page+1];
    
    //执行查询的SQL，用set来接收(查询的所有数据都是用FMResultSet来接收的)
    FMResultSet *set = [_fmdb executeQuery:select];
    
    NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
    
    //遍历查询结果
    while ([set next]) {
        //set会依次代表所有的数据
        StudentModel *sm = [[StudentModel alloc] init];
        
        sm.uid = [set stringForColumn:@"uid"];
        sm.username = [set stringForColumn:@"username"];
        sm.lastactivity = [NSNumber numberWithInt:[set intForColumn:@"lastactivity"]];
        sm.headimage = [set stringForColumn:@"headimage"];
       // sm.page = [set intForColumn:@"page"];
        [tmpArr addObject:sm];
    }
    //解锁
    [_lock unlock];
    NSLog(@"fanghuizhishuzu");
    return tmpArr;
}

@end
