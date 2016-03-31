//
//  MyTabBarController.m
//  A3CustomTabBar
//
//  Created by Mac on 15-7-22.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "LoveViewController.h"
#import "NearViewController.h"
#import "SetViewController.h"

@interface MyTabBarController ()
{
    UIButton *_tmpbtn;
    UILabel *_tmplabel;
}
@end

@implementation MyTabBarController

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
    
    [self createVC];
    [self creatTabBar];
    
    
    
    
}
-(void)createVC
{
    HomeViewController *hvc=[[HomeViewController alloc]init];
    LoveViewController *lvc=[[LoveViewController alloc]init];
    NearViewController *nvc=[[NearViewController alloc]init];
    SetViewController *svc=[[SetViewController alloc]init];
    
    UINavigationController *hnc=[[UINavigationController alloc]initWithRootViewController:hvc];
    
    hvc.navigationItem.title=@"主页";
    
    self.viewControllers=[NSArray arrayWithObjects:hnc,lvc,nvc,svc, nil];
}
-(void)creatTabBar
{
    UIImageView *iv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbg"]];
    
    iv.userInteractionEnabled=YES;
    [self.tabBar addSubview:iv];
    
    NSArray *titleArr=@[@"首页",@"最爱",@"附近",@"设置"];
    for(int i=0;i<4;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(25+80*i, 3, 30, 30);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_%d",i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_c%d",i]] forState:UIControlStateSelected];
        btn.tag=100+i;
        [iv addSubview:btn];
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(-10, 30, 50, 15)];
        label.font=[UIFont systemFontOfSize:8];
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=[UIColor darkGrayColor];
        label.text=titleArr[i];
        [btn addSubview:label];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if(!i){
            btn.selected=YES;
            label.textColor=[UIColor orangeColor];
            
            _tmpbtn=btn;
            _tmplabel=label;
        }
    }
}
-(void)btnClick:(UIButton *)sender
{
//    sender.selected=!sender.selected;
//    if(sender.selected==YES){
//        sender.selected=YES;
//        UILabel *label=sender.subviews.lastObject;
//        label.textColor=[UIColor orangeColor];
//    }else{
//        sender.selected=NO;
//        UILabel *label=sender.subviews.lastObject;
//        label.textColor=[UIColor darkGrayColor];
//    }
    if(_tmpbtn==sender){
        return;
    }
    _tmpbtn.selected=NO;
    _tmplabel.textColor=[UIColor darkGrayColor];
    
    sender.selected=YES;
    UILabel *label=sender.subviews.lastObject;
    label.textColor=[UIColor orangeColor];
    
    _tmpbtn=sender;
    _tmplabel=label;
    //让标签栏控制器里对应的页面展示出来
    self.selectedIndex=sender.tag-100;
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
