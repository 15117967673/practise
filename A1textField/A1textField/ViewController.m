//
//  ViewController.m
//  A1textField
//
//  Created by Mac on 15-7-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//暂时我们先把这个方法理解成self.view自带的点击事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"111");
    UITextField *tf=(UITextField *)[self.view viewWithTag:1000];
    //收起键盘，让某个文本输入框收起键盘
    [tf resignFirstResponder];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor grayColor];
    UITextField *tf=[[UITextField alloc]initWithFrame:CGRectMake(40, 40, 240, 60)];
    //tf.backgroundColor=[UIColor redColor];
    
    tf.tag=1000;
    
    [self.view addSubview:tf];
    //占位提示符
    tf.placeholder=@"请输入QQ号";
    //边框风格
    tf.borderStyle=UITextBorderStyleBezel;
    //如果边框风格是圆角，背景图片无效。如果风格是其他的，图片有效，风格失效
    tf.background=[UIImage imageNamed:@"haha"];
    
    tf.font=[UIFont systemFontOfSize:20];
    //当字符串的长度超过文本输入框的长度，可以自动缩小文字
    tf.adjustsFontSizeToFitWidth=YES;
    //最小可以小到多少
    tf.minimumFontSize=30;
    //水平方向对其方式（同label）
    tf.textAlignment=NSTextAlignmentLeft;
    //垂直方向对其方式（同button）
    tf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    //当弹出键盘的时候，清空tf的文字
    tf.clearsOnBeginEditing=NO;
    
    //设置清空按钮出现的模式
    tf.clearButtonMode=UITextFieldViewModeUnlessEditing;
    //安全输入，（暗文输入，专门用来输入密码使用）
    tf.secureTextEntry=YES;
    //键盘类型
    tf.keyboardType=UIKeyboardTypeDefault;
    //回车键的外观（和功能没有任何关系，功能我们洗衣歌工程学习）
    tf.returnKeyType=UIReturnKeyDone;
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    view.backgroundColor=[UIColor redColor];
    //设置tf左边的附属view和出现的模式（实际工作中一般都用imageview），后面就不可以使用这个view了
    //tf.leftView=view;
    //tf.leftViewMode=UITextFieldViewModeAlways;
    //键盘
    
    //tf.inputView=view;
    //键盘的附属view
    tf.inputAccessoryView=view;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
