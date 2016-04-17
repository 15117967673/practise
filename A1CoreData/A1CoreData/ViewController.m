//
//  ViewController.m
//  A1CoreData
//
//  Created by Mac on 15-8-12.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

#define k_Student @"Student"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_dataArr;
    //通过coredata管理数据库的环境
    //被管理对象上下文
    NSManagedObjectContext *_moc;
    
    NSInteger _currentRow;
}
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _dataArr=[[NSMutableArray alloc]init];
    _currentRow=-1;
    //coreDate文件的路径，注意后缀名是momd
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Person" ofType:@"momd"];
    //目标对象模型（对应的是coreData）
    NSManagedObjectModel *model=[[NSManagedObjectModel alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path]];
    //持久化存储协调器（可以操作coreData）
    NSPersistentStoreCoordinator *coordinator=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    //将要关联的数据库的路径
    NSString *sqlPath=[NSHomeDirectory() stringByAppendingString:@"/Documents/person.sqlite"];
    
    NSError *error=nil;
    //持久化存储协调器关联一个数据库，返回值的作用来判断关联是否成功
    NSPersistentStore *store=[coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlPath] options:nil error:&error];
    
    if(!store){
        NSLog(@"error=%@",error);
    }
    //创建上下文对象（我们进行增删改查的操作，都是通过这个对象）
    _moc=[[NSManagedObjectContext alloc]init];
    //给上下文设置协调器
    _moc.persistentStoreCoordinator=coordinator;
    
    /**************环境搭建完毕******************/
    
    error=nil;
    
    //创建查询请求（查询哪一种实体）
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:k_Student];
   
    //执行查询请求，结果是数组
    NSArray *tepArr=[_moc executeFetchRequest:request error:&error];
    
    if(error){
        NSLog(@"fetch==%@",error);
    }else{
        [_dataArr setArray:tepArr];
    }
    
}
- (IBAction)btnClick:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSError *error=nil;
    switch (sender.tag) {
        case 1:
        {
            //在moc中插入一个实体（一条数据），返回值就是这实体的指针
            Student *dent=[NSEntityDescription insertNewObjectForEntityForName:k_Student inManagedObjectContext:_moc];
            //赋值
            dent.name=_nameTF.text;
            dent.age=@(_ageTF.text.intValue);
            //保存并且判断
            if ([_moc save:&error]) {
                [_dataArr addObject:dent];
                [_tableView reloadData];
            } else {
                
            }
        }
            break;
        case 2:
        {
            if(_currentRow<0){
                return;
            }
            Student *dent=[_dataArr objectAtIndex:_currentRow];
            [_moc deleteObject:dent];
            
            if([_moc save:&error]){
                [_dataArr removeObjectAtIndex:_currentRow];
                [_tableView reloadData];
            }
            
        }
            break;
        case 3:
        {
            if(_currentRow<0){
                return;
            }
            Student *dent=[_dataArr objectAtIndex:_currentRow];
            
            dent.name=_nameTF.text;
            dent.age=@(_ageTF.text.intValue);
            if([_moc save:&error]){
                [_tableView reloadData];
            }else{
            
            }
        }
            
            break;
        case 4:
        {
            //查询请求
            NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:k_Student];
            //请求条件
            //前面有*,后面有*代表只要包含a就会被查出
            //前面有*, 代表后面有a就会被查出
            //后面有*, 前面a就会被查出
            NSPredicate *predicate=[NSPredicate predicateWithFormat:@"name like %@",[NSString stringWithFormat:@"%@*",_nameTF.text]];
            //将查询条件设置给请求
            request.predicate=predicate;
            _dataArr.array=[_moc executeFetchRequest:request error:nil];
            [_tableView reloadData];
        }
            
            break;
        default:
            break;
    }
    _currentRow=-1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"qqq"];
    }
    Student *dent=[_dataArr objectAtIndex:indexPath.row];
    cell.textLabel.text=dent.name;
    cell.detailTextLabel.text=dent.age.stringValue;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _currentRow=indexPath.row;
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    _nameTF.text=cell.textLabel.text;
    _ageTF.text=cell.detailTextLabel.text;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
