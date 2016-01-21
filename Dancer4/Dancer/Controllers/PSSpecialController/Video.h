//
//  Video.h
//  Dancer
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface Video : UIViewController
@property(nonatomic,copy)NSString *strUrl;
@property(nonatomic,copy) MPMoviePlayerController *player;
@end
