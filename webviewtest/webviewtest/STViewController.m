//
//  STViewController.m
//  webviewtest
//
//  Created by Sunsunny on 14/11/25.
//  Copyright (c) 2014年 Sunsunny. All rights reserved.
//

#import "STViewController.h"

@interface STViewController ()
{
    float height ;
}
@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    NSURLRequest * request =[NSURLRequest requestWithURL:[NSURL URLWithString: @"http://app.bast.net.cn/kexiedl/68/2014_11_17/210/0001000000/210.html"]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    self.tableVIew = [[UITableView alloc] init];
    self.tableVIew.delegate = self;
    self.tableVIew.dataSource = self;
    [self.webView.scrollView addSubview:self.tableVIew];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 64.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellName = @"cellName";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =(UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGSize height_size_height  = self.webView.scrollView.contentSize;
    CGFloat qq= 64.f * 3;
    height_size_height.height = height_size_height.height + qq;
    [self.webView.scrollView setContentSize:height_size_height];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tableVIew.frame =CGRectMake(0, self.webView.scrollView.contentSize.height- qq, self.view.frame.size.width, qq);
    });
}

@end
