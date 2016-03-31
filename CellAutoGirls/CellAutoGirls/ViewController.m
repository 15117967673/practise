//
//  ViewController.m
//  CellAutoGirls
//
//  Created by Mac on 15-8-10.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "GielsTableViewCell.h"
#import "GirlModel.h"
#import "UIImageView+AFNetworking.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _dataArr=[[NSMutableArray alloc]init];
    [_tableView registerNib:[UINib nibWithNibName:@"GielsTableViewCell" bundle:nil] forCellReuseIdentifier:@"qqq"];
    NSString *urlStr=@"http://223.6.252.214/weibofun/weibo_list.php?apiver=10500&category=weibo_girls&page=1&page_size=20&max_timestamp=-1";
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"items"];
        for(NSDictionary *appDic in array){
            GirlModel *am=[[GirlModel alloc]init];
            [am setValuesForKeysWithDictionary:appDic];
            [_dataArr addObject:am];
        }
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GielsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq" forIndexPath:indexPath];
    GirlModel *am=[_dataArr objectAtIndex:indexPath.row];
    cell.update_time.text=am.update_time;
    cell.wbody.text=am.wbody;
    cell.likes.text=am.likes;
    cell.comments.text=am.comments;
    [cell.wpic_middle setImageWithURL:[NSURL URLWithString:am.wpic_middle]];
    
    CGSize size=[am.wbody boundingRectWithSize:CGSizeMake(250, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:cell.wbody.font forKey:NSFontAttributeName] context:nil].size;
    CGRect bodyframe=cell.wbody.frame;
    bodyframe.size.height=size.height;
    cell.wbody.frame=bodyframe;
    
    if([am.wbody isEqualToString:@""]){
        cell.wbody.hidden=YES;
        CGRect picframe=cell.wpic_middle.frame;
        picframe.origin.y=cell.update_time.frame.origin.y+cell.update_time.frame.size.height+10;
        cell.wpic_middle.frame=picframe;
        
        CGRect likeframe=cell.likes.frame;
        likeframe.origin.y=cell.wpic_middle.frame.origin.y+cell.wpic_middle.frame.size.height+10;
        cell.likes.frame=likeframe;
        
        CGRect comframe=cell.comments.frame;
        comframe.origin.y=cell.wpic_middle.frame.origin.y+cell.wpic_middle.frame.size.height+10;
        cell.comments.frame=comframe;
    }
    else{
        cell.wbody.hidden=NO;
        CGRect imageframe=cell.wpic_middle.frame;
        imageframe.origin.y=cell.wbody.frame.origin.y+cell.wbody.frame.size.height+10;
        cell.wpic_middle.frame=imageframe;
        
        CGRect likeframe=cell.likes.frame;
        likeframe.origin.y=cell.wpic_middle.frame.origin.y+cell.wpic_middle.frame.size.height+10;
        cell.likes.frame=likeframe;
        
        CGRect comframe=cell.comments.frame;
        comframe.origin.y=cell.wpic_middle.frame.origin.y+cell.wpic_middle.frame.size.height+10;
        cell.comments.frame=comframe;
        
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GirlModel *am=[_dataArr objectAtIndex:indexPath.row];
    CGFloat height=[am.wbody boundingRectWithSize:CGSizeMake(250, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName ]  context:nil].size.height;
    if([am.wbody isEqualToString:@""]){
        return 450-10-20;
    }
    return 450-20+height;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
