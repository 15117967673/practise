//
//  RepeatPassWord.m
//  smartHome
//
//  Created by zcznx on 15/11/10.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "RepeatPassWord.h"
#import "Masonry.h"
@interface RepeatPassWord ()
{
    UILabel *labelNum;
    UITextField *tfPass;
    UITextField *tfConfirm;
}
@end

@implementation RepeatPassWord

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    
    labelNum=[[UILabel alloc]init];
    labelNum.text=@"注册手机号:138xxxxxxxx";
    labelNum.textColor=[UIColor whiteColor];
    //labelNum.backgroundColor=[UIColor redColor];
    [self.view addSubview:labelNum];
    [labelNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.top.equalTo(self.view.mas_top).offset(80);
        make.height.equalTo(@(35));
    }];
    
    
    tfPass=[[UITextField alloc]init];
    tfPass.backgroundColor=[UIColor clearColor];
    tfPass.placeholder=@"请输入新密码";
    tfPass.layer.borderWidth=1;
    tfPass.layer.borderColor=[[UIColor whiteColor]CGColor];
    tfPass.layer.cornerRadius=5;
    
    [self.view addSubview:tfPass];
    [tfPass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelNum.mas_bottom).offset(15);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@(40));
    }];
    
    
    tfConfirm=[[UITextField alloc]init];
    tfConfirm.backgroundColor=[UIColor clearColor];
    tfConfirm.placeholder=@"请确认新密码";
    tfConfirm.layer.borderWidth=1;
    tfConfirm.layer.borderColor=[[UIColor whiteColor]CGColor];
    tfConfirm.layer.cornerRadius=5;
    tfConfirm.secureTextEntry=NO;
    [self.view addSubview:tfConfirm];
    [tfConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tfPass.mas_bottom).offset(15);
        make.left.equalTo(tfPass.mas_left);
        make.right.equalTo(tfPass.mas_right);
        make.height.equalTo(@(40));
    }];
    
    UIButton *btnDone=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnDone setTitle:@"完成" forState:UIControlStateNormal];
    [btnDone setTintColor:[UIColor whiteColor]];
    btnDone.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnDone.layer.borderWidth=1;
    btnDone.layer.cornerRadius=10;
    [btnDone addTarget:self action:@selector(btnDone:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDone];
    [btnDone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.top.equalTo(tfConfirm.mas_bottom).offset(50);
        make.height.equalTo(@(30));
    }];


}
-(void)btnDone:(UIButton *)sender
{
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}





@end
