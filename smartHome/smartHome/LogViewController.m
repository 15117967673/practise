//
//  LogViewController.m
//  smartHome
//
//  Created by zcznx on 15/10/29.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "LogViewController.h"
#import "Masonry.h"
#import "MyTabBarController.h"
#import "RegiterViewController.h"
#import "FindPassWord.h"
@interface LogViewController ()
{
    UITextField *tf2;
}
@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    self.navigationItem.title=@"用户登陆";
    
    
    
    UITextField *tf1=[[UITextField alloc]init];
    tf1.backgroundColor=[UIColor clearColor];
    tf1.placeholder=@"请输入登陆手机号";
    tf1.layer.borderWidth=1;
    tf1.layer.borderColor=[[UIColor whiteColor]CGColor];
    tf1.layer.cornerRadius=5;
    
    [self.view addSubview:tf1];
    [tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(120);
        make.left.equalTo(self.view.mas_left).offset(60);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.height.equalTo(@(40));
    }];
    
    
    tf2=[[UITextField alloc]init];
    tf2.backgroundColor=[UIColor clearColor];
    tf2.placeholder=@"请输入登录密码";
    tf2.layer.borderWidth=1;
    tf2.layer.borderColor=[[UIColor whiteColor]CGColor];
    tf2.layer.cornerRadius=5;
    tf2.secureTextEntry=NO;
    [self.view addSubview:tf2];
    [tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tf1.mas_bottom).offset(30);
        make.left.equalTo(tf1.mas_left);
        make.right.equalTo(tf1.mas_right);
        make.height.equalTo(@(40));
    }];
    
    
    UIButton *btnEye=[[UIButton alloc]init];
    btnEye.backgroundColor=[UIColor yellowColor];
    [btnEye setBackgroundImage:[UIImage imageNamed:@"eye"] forState:UIControlStateNormal];
    [tf2 addSubview:btnEye];
    tf2.rightView=btnEye;
    tf2.rightViewMode=UITextFieldViewModeAlways;
    
    [btnEye addTarget:self action:@selector(btnEye:) forControlEvents:UIControlEventTouchUpInside];
    [btnEye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tf2.mas_top);
        make.right.equalTo(tf2.mas_right);
        make.bottom.equalTo(tf2.mas_bottom);
        make.width.equalTo(@(40));
    }];

    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    //[btn setBackgroundImage:[UIImage imageNamed:@"dian"] forState:UIControlStateNormal];
    btn.layer.borderColor=[[UIColor whiteColor]CGColor];
    btn.layer.borderWidth=1;
    btn.layer.cornerRadius=7.5;
    btn.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf2);
        make.top.equalTo(tf2.mas_bottom).offset(10);
        make.width.equalTo(@(15));
        make.height.equalTo(@(15));
    }];
    
    UIImageView *imageView=[[UIImageView alloc]init];
    imageView.layer.borderColor=[[UIColor blackColor]CGColor];
    imageView.layer.borderWidth=1;
    imageView.layer.cornerRadius=4;
    imageView.backgroundColor=[UIColor blackColor];
    imageView.hidden=YES;
    imageView.tag=1001;
    [btn addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(8));
        make.width.equalTo(@(8));
        make.centerX.equalTo(btn);
        make.centerY.equalTo(btn);
    }];
    
    UIButton *btnRem=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnRem setTitle:@"记住密码" forState:UIControlStateNormal];
    [btnRem setTintColor:[UIColor whiteColor]];
    [self.view addSubview:btnRem];
   // btnRem.backgroundColor=[UIColor yellowColor];
    [btnRem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn.mas_right).offset(10);
        make.top.equalTo(btn);
        make.bottom.equalTo(btn.mas_bottom);
        make.width.equalTo(@(60));
    }];
    
    UIButton *btnForget=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnForget setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [btnForget setTintColor:[UIColor whiteColor]];
    [self.view addSubview:btnForget];
    [btnForget addTarget:self action:@selector(btnForget:) forControlEvents:UIControlEventTouchUpInside];
    [btnForget mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(tf2.mas_right);
        make.top.equalTo(btnRem.mas_top);
        make.bottom.equalTo(btnRem.mas_bottom);
        make.width.equalTo(@(70));
    }];
    
    UIButton *btnLog=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnLog setTitle:@"登录" forState:UIControlStateNormal];
    [btnLog setTintColor:[UIColor whiteColor]];
    btnLog.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnLog.layer.borderWidth=1;
    btnLog.layer.cornerRadius=10;
    [btnLog addTarget:self action:@selector(btnLog:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLog];
    [btnLog mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf2.mas_left);
        make.right.equalTo(tf2.mas_right);
        make.top.equalTo(btnRem.mas_bottom).offset(25);
        make.height.equalTo(@(30));
    }];

    UIButton *btnRegister=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnRegister setTitle:@"注册账号" forState:UIControlStateNormal];
    [btnRegister setTintColor:[UIColor whiteColor]];
    [self.view addSubview:btnRegister];
    [btnRegister addTarget:self action:@selector(btnRegister:) forControlEvents:UIControlEventTouchUpInside];
    [btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btnLog.mas_right);
        make.top.equalTo(btnLog.mas_bottom).offset(10);
        make.left.equalTo(btnForget.mas_left);
        make.width.equalTo(@(70));
    }];

    
    
    

}
-(void)btnForget:(UIButton *)sender
{
    FindPassWord *findView=[[FindPassWord alloc]init];
    [self.navigationController pushViewController:findView animated:YES];
}
-(void)btnClick:(UIButton *)sender
{
    sender.selected=!sender.selected;
    UIImageView *imageView=(UIImageView *)[self.view viewWithTag:1001];
    if(sender.selected==YES){

    imageView.hidden=NO;
    }else{
        imageView.hidden=YES;
    }
    
}
-(void)btnEye:(UIButton *)sender
{
    sender.selected=!sender.selected;
    if(sender.selected==YES){
        tf2.secureTextEntry=YES;
    }else{
        tf2.secureTextEntry=NO;
    }
}
-(void)btnLog:(UIButton *)sender
{
    MyTabBarController *tabBar=[[MyTabBarController alloc]init];
    [self presentViewController:tabBar animated:YES completion:nil];
}
-(void)btnRegister:(UIButton *)sender
{
    RegiterViewController *rvc=[[RegiterViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)btnnClick:(UIButton *)sender
{
  
}
@end
