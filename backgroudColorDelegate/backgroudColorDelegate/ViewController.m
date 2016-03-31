//
//  ViewController.m
//  backgroudColorDelegate
//
//  Created by Mac on 15-7-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()<NextViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor yellowColor];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 80, 300, 50)];
    label.text=@"A";
    label.textColor=[UIColor redColor];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NextViewController *nvc=[[NextViewController alloc]init];
    nvc.delegate=self;
    [self presentViewController:nvc animated:YES completion:nil];
    //在外部对.view修改的时候 会直接执行viewdidload
    //nvc.view.backgroundColor=[UIColor colorWithRed:arc4random()%10*0.1 green:arc4random()%10*0.1 blue:arc4random()%10*0.1 alpha:1];
}
 -(void)getColor:(UIColor *)backgroudColor
{
    self.view.backgroundColor=backgroudColor;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
