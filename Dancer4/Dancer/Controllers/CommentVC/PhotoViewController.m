//
//  PhotoViewController.m
//  Dancer
//
//  Created by qianfeng on 15/9/9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PhotoViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Masonry.h"
#import "UIViewAdditions.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
@interface PhotoViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;


@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray * imageViewArray = [NSMutableArray arrayWithCapacity:self.urlArray.count];
        for (NSString * url in self.urlArray) {
        //NSLog(@"self.urlArray.count:%d",self.urlArray.count);
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:imageView];
        UIActivityIndicatorView * aiv =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [imageView addSubview:aiv];
        [aiv startAnimating];
        [aiv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(imageView.mas_centerX);
            make.centerY.equalTo(imageView.mas_centerY);
        }];
        
//        [imageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            [aiv stopAnimating];
//        }];
        [imageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [aiv stopAnimating];
        }];
        
        [imageViewArray addObject:imageView];
    }
    
    for (NSInteger i=0; i<imageViewArray.count; i++) {
        UIImageView * imageView = imageViewArray[i];
        UIImageView * lastView = i==0 ? nil : imageViewArray[i-1];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView.mas_top);
            if (!lastView) {
                make.left.equalTo(self.scrollView.mas_left);
            }
            else {
                make.left.equalTo(lastView.mas_right);
            }
            
            make.width.equalTo(self.scrollView.mas_width);
            make.height.equalTo(self.scrollView.mas_height);
        }];
    }
    
    self.pagecontrol.numberOfPages = self.urlArray.count;
    self.pagecontrol.currentPage = self.index;
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled=YES;

    
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapped:)];
    [self.view addGestureRecognizer:gesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onTapped: (UITapGestureRecognizer *) gesture
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.scrollView.backgroundColor=[UIColor blackColor];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width*self.urlArray.count, self.scrollView.height);
    self.scrollView.contentOffset = CGPointMake(self.scrollView.width*self.pagecontrol.currentPage, 0);
   }


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger newIndex = self.scrollView.contentOffset.x / self.scrollView.width;
    if (newIndex>=0) {
       // NSLog(@"newIndex=%d",newIndex);
        self.pagecontrol.currentPage = newIndex;
    }
}

-(BOOL)shouldAutorotate {
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
@end