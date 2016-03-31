//
//  HomeViewController.m
//  A3CustomTabBar
//
//  Created by Mac on 15-7-22.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "HomeViewController.h"
#import "SetViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
     self.view.backgroundColor=[UIColor redColor];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SetViewController *svc=[[SetViewController alloc]init];
    svc.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:svc animated:YES];
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
