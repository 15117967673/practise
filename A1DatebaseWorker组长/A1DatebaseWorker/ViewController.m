//
//  ViewController.m
//  A1DatebaseWorker
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "StudentCell.h"
#import "AFNetworking.h"
#import "DatabaseManager.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_dataArr;
    int _newNum;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *qianBtn = [[UIBarButtonItem alloc] initWithTitle:@"前" style:UIBarButtonItemStyleBordered target:self action:@selector(qianBtnClick)];
    UIBarButtonItem *houBtn = [[UIBarButtonItem alloc] initWithTitle:@"后" style:UIBarButtonItemStyleBordered target:self action:@selector(houBtnClick)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:houBtn,qianBtn, nil];
    _newNum = 1;
    _dataArr = [[NSMutableArray alloc] init];
    
    BOOL isZat = [[DatabaseManager defauleManager] selectWithModelpage:_newNum*5];
    if (isZat) {
        _dataArr.array = [[DatabaseManager defauleManager] selectAllModelWithModelPage:_newNum*5];
        [_tableView reloadData];
    }else{
    [self getDataWithNum:_newNum];
    }
    
}

- (void)qianBtnClick
{
    if (_newNum >1) {
        _newNum--;
        BOOL isZat = [[DatabaseManager defauleManager] selectWithModelpage:_newNum*5];
        if (isZat) {
            _dataArr.array = [[DatabaseManager defauleManager] selectAllModelWithModelPage:_newNum*5];
            [_tableView reloadData];
        }else{
            [_dataArr removeAllObjects];
            [self getDataWithNum:_newNum];
        }
        NSLog(@"qian = %d",_newNum);
    }
}

- (void)houBtnClick
{
    [_dataArr removeAllObjects];
    _newNum++;
    BOOL isZat = [[DatabaseManager defauleManager] selectWithModelpage:_newNum*5];
    if (isZat) {
        _dataArr.array = [[DatabaseManager defauleManager] selectAllModelWithModelPage:_newNum*5];
        [_tableView reloadData];
    }else{
        [_dataArr removeAllObjects];
        [self getDataWithNum:_newNum];
    }
    NSLog(@"hou = %d",_newNum);
}

- (void)getDataWithNum:(int)page
{
    NSString *urlStr = [NSString stringWithFormat:@"http://10.0.8.8/sns/my/user_list.php?page=%d&number=5",page];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *newArr = [dict objectForKey:@"users"];
        
        for (NSDictionary *newDic in newArr) {
            
            StudentModel *sm = [[StudentModel alloc] init];
            [sm setValuesForKeysWithDictionary:newDic];
            [_dataArr addObject:sm];
        [[DatabaseManager defauleManager] insertDataWithModel:sm];
        }
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"fail");
    }];
    
   // [_tableView registerNib:[UINib nibWithNibName:@"StudentCell" bundle:nil] forCellReuseIdentifier:@"qqq"];
}



#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"StudentCell" owner:self options:nil] lastObject];
    }
    
    [cell customWithModel:[_dataArr objectAtIndex:indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
