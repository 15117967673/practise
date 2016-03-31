//
//  BViewController.m
//  A1TabBar
//
//  Created by Mac on 15-7-22.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "BViewController.h"
#import "GViewController.h"
@interface BViewController ()

@end

@implementation BViewController

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
    self.view.backgroundColor=[UIColor orangeColor];
    NSLog(@"%s",__func__);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    GViewController *gvc=[[GViewController alloc]init];
    //推出新页面的时候，隐藏底部标签栏，返回的时候会自动出现
    gvc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:gvc animated:YES];
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
