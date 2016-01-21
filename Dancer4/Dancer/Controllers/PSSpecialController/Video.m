//
//  Video.m
//  Dancer
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Video.h"
#import "AFNetworking.h"
#import <MediaPlayer/MediaPlayer.h>
@interface Video ()
{
    
    UIButton *btn;
    NSString *vedio_url;
}
@end

@implementation Video

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // self.navigationController.navigationBar.translucent = NO;
    NSString *urlString = _strUrl;
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.automaticallyAdjustsScrollViewInsets=YES;
    
    AFHTTPRequestOperationManager *mamager=[AFHTTPRequestOperationManager manager];
    mamager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [mamager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *data=[[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil]objectForKey:@"data"];
        
        NSDictionary *videoDic=[data objectForKey:@"video"];
        NSString *video=[NSString stringWithFormat:@"%@/%@",[videoDic objectForKey:@"host"],[videoDic objectForKey:@"filepath"]];
        vedio_url=video;
        
        NSLog(@"strrrewee:%@",vedio_url);
        _player= [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:vedio_url]];
        _player.view.frame=CGRectMake(0, 64, SCREENW, 200*SCREENH/480);
        [self.view addSubview:_player.view];
        
        btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(SCREENW/2-40, 100*SCREENH/480-40, 80, 80);
        [btn setBackgroundImage:[UIImage imageNamed:@"dd_item_playicon_@2x"] forState:UIControlStateNormal];
        [_player.view addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=1000;

        

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail........");
        
    }];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_player stop];
}
-(void)btnClick:(UIButton *)sender
{
    
    btn.hidden=YES;
    NSLog(@"btn.tag=%d..",btn.tag);
    [_player play];
}


@end
