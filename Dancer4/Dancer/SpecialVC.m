//
//  SpecialVC.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SpecialVC.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "ASpecialVC.h"
#import "BSpecialVC.h"
#import "CSpecialVC.h"
#import "DSpecialVC.h"
#import "PSSpecialController.h"
#import "DanceWebView.h"
#import "SpecialModel.h"
#import "Video.h"
#import "ASpecialVC.h"
#import <MediaPlayer/MediaPlayer.h>

@interface SpecialVC ()<UIScrollViewDelegate,PSSpecialControllerDelegete,ASpecialVCDelegate,BSpecialVCDelegate,CSpecialVCDelegate,DSpecialVCDelegate>
{
    UIView *_view;
    NSMutableArray *_btnArr;
    UIScrollView *_sv;
    NSMutableArray *_dataArr;
    NSMutableArray *_stringArr;
   // MPMoviePlayerViewController *_player;
}
@end

@implementation SpecialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _btnArr=[[NSMutableArray alloc]init];
    _dataArr=[[NSMutableArray alloc]init];
    _stringArr =[[NSMutableArray alloc]init];
    UIView *viewback=[[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREENW, 30*(SCREENH/480))];
    viewback.backgroundColor=[UIColor redColor];
    [self.view addSubview:viewback];
    
    _view=[[UIView alloc]initWithFrame:CGRectMake(5*(SCREENW/320), 69, 70*(SCREENW/320), 20*(SCREENH/480))];
    _view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_view];
    
    NSArray *array=@[@"健身",@"化妆",@"编排",@"小贴士"];
    for(int i=0;i<4;i++){
        UIButton *btn=[[UIButton alloc]init];
        btn.backgroundColor=[UIColor clearColor];
        btn.frame=CGRectMake(80*i*(SCREENW/320), 64, 80*(SCREENW/320), 30*(SCREENH/480));
        btn.tag=1000+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [_btnArr addObject:btn];
        if(i==0){
           [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
    
    _sv=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+30*(SCREENH/480), SCREENW, SCREENH-134)];
    _sv.contentSize=CGSizeMake(SCREENW*4, SCREENH-134);
    _sv.pagingEnabled=YES;
    [self.view addSubview:_sv];
    
    _sv.delegate=self;
    
    _avc=[[ASpecialVC alloc]init];
    _avc.delegate=self;
    _bvc=[[BSpecialVC alloc]init];
    _bvc.delegate=self;
    _cvc=[[CSpecialVC alloc]init];
    _cvc.delegate=self;
    _dvc=[[DSpecialVC alloc]init];
    _dvc.delegate=self;
    //PSSpecialController *ps=[[PSSpecialController alloc]init];
    //ps.delegate=self;
    _avc.view.frame=CGRectMake(0,         0,  SCREENW, SCREENH-134);
    _bvc.view.frame=CGRectMake(SCREENW,   0,  SCREENW, SCREENH-134);
    _cvc.view.frame=CGRectMake(SCREENW*2, 0,  SCREENW, SCREENH-134);
    _dvc.view.frame=CGRectMake(SCREENW*3, 0,  SCREENW, SCREENH-134);
    [_sv addSubview:_avc.view];
    [_sv addSubview:_bvc.view];
    [_sv addSubview:_cvc.view];
    [_sv addSubview:_dvc.view];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundImage:[UIImage imageNamed:@"module_6944_press"] forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 0, 30, 30);
    [btn addTarget:self action:@selector(presentLeft) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=leftItem;
}
-(void)presentLeft
{
    AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark - ASpecialVCDelegate
-(void)modelValue:(SpecialModel *)model
{
    NSLog(@"33333333333");
    if(model.childsData.count!=0){
        //推出新界面 contenturl
        
        DanceWebView *webView=[[DanceWebView alloc]init];
        webView.strUrl=model.contentUrl;
        NSLog(@"webview:%@",webView.strUrl);
        webView.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:webView animated:YES];
        
    }
    else{
        //推出新界面
        NSLog(@"非基本功");
        Video *dv=[[Video alloc]init];
        dv.strUrl=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/content/%@",model.Id];
        dv.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:dv animated:YES];
        
    }

}
#pragma mark - btnClick
-(void)btnClick:(UIButton *)sender
{
    UIButton *btnClicked=(UIButton *)[self.view viewWithTag:sender.tag];
    for(UIButton *btn in _btnArr){
        if(btnClicked==btn){
           [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint center=_view.center;
        center.x=btnClicked.center.x;
        _view.center=center;
        
        CGPoint off=_sv.contentOffset;
        off.x=(btnClicked.frame.origin.x/80)*320;
        _sv.contentOffset=off;
    }];
}
#pragma mark - scrollview
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (scrollView.contentOffset.x < 0)
    {
        AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.sideMenuViewController presentLeftMenuViewController];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame=_view.frame;
        frame.origin.x=(5+(scrollView.contentOffset.x/320)*80);
        _view.frame=frame;
        for(UIButton *btn in _btnArr){
            if(btn.frame.origin.x==_view.frame .origin.x-5){
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }else{
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        }
    }];
}
@end
