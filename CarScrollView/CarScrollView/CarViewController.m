//
//  CarViewController.m
//  CarScrollView
//
//  Created by Mac on 15-7-24.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "CarViewController.h"

@interface CarViewController ()<UIScrollViewDelegate>
{
    UIScrollView *sv2;
    UILabel *label;
}
@end

@implementation CarViewController

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
    UIScrollView *sv1=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 30, 320, 150)];
    [self.view addSubview:sv1];
    sv1.contentSize=CGSizeMake(400, 150);
   
    sv1.pagingEnabled=YES;
    
    for(int i=0;i<4;i++){
        UIImageView *iv1=[[UIImageView alloc]initWithFrame:CGRectMake(i*100, 0, 100, 150)];
        iv1.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        iv1.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        iv1.tag=2000+i;
        [iv1 addGestureRecognizer:tap];
        [sv1 addSubview:iv1];
    }
    
    sv2=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 180, 320, 300)];
    [self.view addSubview:sv2];
    sv2.contentSize=CGSizeMake(4*320, 300);
    sv2.pagingEnabled=YES;
    
    for(int i=0;i<4;i++){
        UIImageView *iv2=[[UIImageView alloc]initWithFrame:CGRectMake(i*320, 0, 320, 300)];
        iv2.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        iv2.userInteractionEnabled=YES;
        [sv2 addSubview:iv2];
        sv2.delegate=self;
        
    }
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(60, 5, 200, 20)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=[NSString stringWithFormat:@"第%0.f页",sv2.contentOffset.x/320+1];
    label.textColor=[UIColor redColor];
    [self.view addSubview:label];
    label.tag=1000;
    
    NSArray *array=@[@"btn_prepage",@"btn_home",@"btn_nextpage"];
    for(int i=0;i<3;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",array[i]]] forState:UIControlStateNormal];
        btn.frame=CGRectMake(20+i*100, 450, 25, 25);
        btn.tag=3000+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside ];
        [self.view addSubview:btn];
    }
   
}
-(void)btnClick:(UIButton *)sender
{
    if(sender.tag==3000&&sv2.contentOffset.x>0){
      
        
        CGPoint off=sv2.contentOffset;
        off.x-=320;
        [UIView animateWithDuration:1 animations:^{
            sv2.contentOffset=off;
        }];
        
        label.text=[NSString stringWithFormat:@"第%0.f页",sv2.contentOffset.x/320+1];
        


    }
       if(sender.tag==3002&&sv2.contentOffset.x<960){
           CGPoint off=sv2.contentOffset;
           off.x+=320;
           [UIView animateWithDuration:1 animations:^{
               sv2.contentOffset=off;
           }];
           
        label.text=[NSString stringWithFormat:@"第%0.f页",sv2.contentOffset.x/320+1];
        }
    
    if(sender.tag==3001){
        CGPoint off=sv2.contentOffset;
        off.x=0;
        [UIView animateWithDuration:1 animations:^{
            sv2.contentOffset=off;
        }];

        label.text=[NSString stringWithFormat:@"第%0.f页",sv2.contentOffset.x/320+1];

    }


}
-(void)tapClick:(UITapGestureRecognizer *)sender
{
    
   
    CGPoint off=sv2.contentOffset;
    
   
    off.x=(sender.view.tag-2000)*320;
    
    [UIView animateWithDuration:1 animations:^{
        sv2.contentOffset=off;
    }];
     label.text=[NSString stringWithFormat:@"第%0.f页",sv2.contentOffset.x/320+1];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    label.text=[NSString stringWithFormat:@"第%0.f页",sv2.contentOffset.x/320+1];

}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    UILabel *label=(UILabel *)[self.view viewWithTag:1000];
//    NSLog(@"%@",NSStringFromCGRect(label.frame));
//    label.text=[NSString stringWithFormat:@"%f",scrollView.contentOffset.x/320+1];
//}

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
