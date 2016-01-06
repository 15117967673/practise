//
//  LeftDetailViewController.h
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface LeftDetailViewController : UIViewController
@property(nonatomic,copy)NSString *danceTypeId;
@property(nonatomic,copy)NSString *strUrl;
@property(nonatomic,copy)MPMoviePlayerViewController *player;
@end
