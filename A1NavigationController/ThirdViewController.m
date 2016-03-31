//
//  ThirdViewController.m
//  A1NavigationController
//
//  Created by Mac on 15-7-20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourthViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    
    self.view.backgroundColor=[UIColor yellowColor];
    //返回到根，沿途所有的页面全部销毁
    [self customBackButtonwithTitle:@"返回到根" action:@selector(backClick)];
    
    self.navigationItem.title=@"yellow";
    
    NSLog(@"%s",__func__);
    
}
-(void)backClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    FourthViewController *fvc=[[FourthViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
     NSLog(@"%s",__func__);
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     NSLog(@"%s",__func__);}
-(void)viewWillDisappear:(BOOL)animated
{
     NSLog(@"%s",__func__);
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
     NSLog(@"%s",__func__);
    [super viewDidDisappear:animated];
}
-(void)dealloc
{
    NSLog(@"%s",__func__);
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
