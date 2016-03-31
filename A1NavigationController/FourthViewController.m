
//
//  FourthViewController.m
//  A1NavigationController
//
//  Created by Mac on 15-7-20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor greenColor];
    
    [self customBackButtonwithTitle:@"返回到橙" action:@selector(backclick)];
    
    self.navigationItem.title=@"green";
    
    NSLog(@"加载UI");
}
-(void)backclick
{
    //找到导航控制器里所有的页面
    NSArray *vcArr=self.navigationController.viewControllers;
    //NSLog(@"==%zd,",vcArr.count);
    //通过数组找到某一个固定的页面，用父类指针接受
    UIViewController *vc=[vcArr objectAtIndex:1];
    //返回某一个固定的页面
    [self.navigationController popToViewController:vc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"视图即将出现");
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"已经出现");
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"即将消失");
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"已经消失");
    [super viewDidDisappear:animated];
}
-(void)dealloc
{
    NSLog(@"死亡");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
