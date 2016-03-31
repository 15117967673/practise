
//
//  RootViewController.m
//  A4chessMove
//
//  Created by Mac on 15-7-15.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    UIButton *_tmpBtn;
}
@end

@implementation RootViewController

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
    
    NSArray *titleArr=@[@"车",@"马",@"象",@"王",@"后",@"象",@"马",@"车"];
    
    for(int i=0;i<8;i++){
        for(int j=0;j<8;j++){
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(40*j,40*i+60, 40, 40 )];
            if((i+j)%2){
                view.backgroundColor=[UIColor whiteColor];
            }else{
                view.backgroundColor=[UIColor blackColor];
            }
            [self.view addSubview:view];
            
            
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame=CGRectMake(40*j,40*i+60, 40, 40);
            if(i<2){
                [btn setTitleColor:[UIColor redColor] forState:0];
                if(!i){
                    [btn setTitle:titleArr[j] forState:0];
                }else{
                    [btn setTitle:@"兵" forState:0];
                }
            }
            if(i>5){
                [btn setTitleColor:[UIColor greenColor] forState:0];
                if(i==7){
                    [btn setTitle:titleArr[7-j] forState:0];
                }else{
                    [btn setTitle:@"兵" forState:0];
                }
            }
            btn.titleLabel.font=[UIFont systemFontOfSize:30];
            [self.view addSubview:btn];
            
            btn.tag=i*8+j+1;
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}
-(void)buttonClick:(UIButton *)sender
{
    NSLog(@"%zd",sender.tag);
    //如果没有这句话，位置变了，层级没变
    [self.view bringSubviewToFront:sender];
    if(sender.tag<17||sender.tag>48){
        NSLog(@"有字");
        _tmpBtn=sender;
    }else{
        NSLog(@"无字");
        if(_tmpBtn){
          CGRect frame=_tmpBtn.frame;
          _tmpBtn.frame=sender.frame;
           // _tmpBtn.backgroundColor=[UIColor whiteColor];
            //sender.backgroundColor=[UIColor yellowColor];
          sender.frame=frame;
          //_tmpBtn=nil;
        }
    }
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
