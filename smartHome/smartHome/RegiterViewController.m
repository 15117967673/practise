//
//  RegiterViewController.m
//  smartHome
//
//  Created by zcznx on 15/10/30.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "RegiterViewController.h"
#import "Masonry.h"
#import "Reg2ViewController.h"
@interface RegiterViewController ()
{
    UITextField *tf2;
}
@end

@implementation RegiterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    
    UITextField *tf1=[[UITextField alloc]init];
    tf1.backgroundColor=[UIColor clearColor];
    tf1.placeholder=@"请输入登陆手机号";
    tf1.layer.borderWidth=1;
    tf1.layer.borderColor=[[UIColor whiteColor]CGColor];
    tf1.layer.cornerRadius=5;
    [self.view addSubview:tf1];
    [tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(120);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@(35));
    }];

    tf2=[[UITextField alloc]init];
    tf2.backgroundColor=[UIColor clearColor];
    tf2.placeholder=@"请输入登陆密码";
    tf2.layer.borderWidth=1;
    tf2.layer.borderColor=[[UIColor whiteColor]CGColor];
    tf2.layer.cornerRadius=5;
    tf2.secureTextEntry=YES;
    [self.view addSubview:tf2];
    [tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf1.mas_left);
        make.right.equalTo(tf1.mas_right);
        make.top.equalTo(tf1.mas_bottom).offset(20);
        make.height.equalTo(@(35));
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
        make.width.equalTo(@(35));
    }];


    UITextField *tfVerificationCode=[[UITextField alloc]init];
    tfVerificationCode.backgroundColor=[UIColor clearColor];
    tfVerificationCode.placeholder=@"请输入验证码";
    tfVerificationCode.layer.borderWidth=1;
    tfVerificationCode.layer.borderColor=[[UIColor whiteColor]CGColor];
    tfVerificationCode.layer.cornerRadius=5;
    [self.view addSubview:tfVerificationCode];
    [tfVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tf2.mas_bottom).offset(20);
        make.left.equalTo(tf2.mas_left);
        make.width.equalTo(@(120));
        make.height.equalTo(@(35));
    }];
    
    UIButton *btnGetVerification=[UIButton buttonWithType:UIButtonTypeCustom];
    //[btn setBackgroundImage:[UIImage imageNamed:@"dian"] forState:UIControlStateNormal];
    btnGetVerification.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnGetVerification.layer.borderWidth=1;
    btnGetVerification.layer.cornerRadius=35/2;
    //btn.backgroundColor=[UIColor whiteColor];
    [btnGetVerification setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btnGetVerification setTintColor:[UIColor whiteColor]];
    [self.view addSubview:btnGetVerification];
    [btnGetVerification addTarget:self action:@selector(btnGetVerificationClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnGetVerification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tfVerificationCode.mas_right).offset(10);
        make.top.equalTo(tf2.mas_bottom).offset(20);
        make.width.equalTo(@(110));
        make.height.equalTo(@(35));
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
        make.left.equalTo(tfVerificationCode);
        make.top.equalTo(tfVerificationCode.mas_bottom).offset(10);
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
    
    UILabel *lable=[[UILabel alloc]init];
    lable.text=@"同意";
    lable.textColor=[UIColor whiteColor];
    [self.view addSubview:lable];
    // btnRem.backgroundColor=[UIColor yellowColor];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn.mas_right).offset(10);
        make.top.equalTo(btn);
        make.bottom.equalTo(btn.mas_bottom);
        make.width.equalTo(@(35));
    }];

    
    UIButton *btnRule=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnRule setTitle:@"支持科技用户协议" forState:UIControlStateNormal];
    [btnRule setTintColor:[UIColor blueColor]];
    [self.view addSubview:btnRule];
    [lable sizeToFit];
     //btnRule.backgroundColor=[UIColor yellowColor];
    [btnRule mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lable.mas_right);
        make.top.equalTo(btn);
        make.bottom.equalTo(btn.mas_bottom);
        make.width.equalTo(@(130));
    }];
    
    UIButton *btnRegister=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnRegister setTitle:@"注册" forState:UIControlStateNormal];
    [btnRegister setTintColor:[UIColor whiteColor]];
    btnRegister.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnRegister.layer.borderWidth=1;
    btnRegister.layer.cornerRadius=10;
    [btnRegister addTarget:self action:@selector(btnRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRegister];
    [btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf2.mas_left);
        make.right.equalTo(tf2.mas_right);
        make.top.equalTo(btnRule.mas_bottom).offset(25);
        make.height.equalTo(@(30));
    }];



    
}
-(void)btnGetVerificationClick:(UIButton *)sender
{
    NSLog(@"get");
    [sender setTitleColor:[UIColor colorWithRed:0.7569 green:0.7569 blue:0.7373 alpha:1] forState:UIControlStateNormal];
    sender.enabled=NO;
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

-(void)btnRegister:(UIButton *)sender
{
    Reg2ViewController *reg2=[[Reg2ViewController alloc]init];
    [self.navigationController pushViewController:reg2 animated:YES];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
