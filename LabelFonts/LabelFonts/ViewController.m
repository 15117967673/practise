//
//  ViewController.m
//  LabelFonts
//
//  Created by Mac on 15-8-7.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfFirst;
@property (weak, nonatomic) IBOutlet UITextField *tfSecond;
@property (weak, nonatomic) IBOutlet UITextField *tfThird;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

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
    // Do any additional setup after loading the view from its nib.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)btnClick:(id)sender {
    
        // _label.text=[NSString stringWithFormat:@"%@%@%@",_tfFirst.text,_tfSecond.text,_tfThird.text];
   // self.title = @"For iOS 6 & later";
    NSString *strStr=[NSString stringWithFormat:@"%@%@%@",_tfFirst.text,_tfSecond.text,_tfThird.text];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:strStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,_tfFirst.text.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(_tfFirst.text.length,_tfSecond.text.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(_tfFirst.text.length+_tfSecond.text.length,_tfThird.text.length)];
    
    
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0] range:NSMakeRange(0,_tfFirst.text.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Zapfino" size:30.0] range:NSMakeRange(_tfFirst.text.length,_tfSecond.text.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0] range:NSMakeRange(_tfFirst.text.length+_tfSecond.text.length,_tfThird.text.length)];
    
    _label.attributedText = str;

    
    CGSize size1=[_tfFirst.text sizeWithAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0],NSFontAttributeName,nil]];
    CGSize size2=[_tfSecond.text sizeWithAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Zapfino" size:30.0],NSFontAttributeName,nil]];
    CGSize size3=[_tfThird.text sizeWithAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0],NSFontAttributeName,nil]];
    CGRect frame=_label.frame;
    frame.size.height=size2.height;
    frame.size.width=size1.width+size2.width+size3.width;
    _label.frame=frame;
    NSLog(@"a=%f,b=%f",size1.width,size2.width);
    
    NSArray *arr=[UIFont familyNames];
    for(UIFont *font in arr){
        NSLog(@"font=%@",font);
    }
//    CGSize size=[_label.text sizeWithAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:30.0],NSFontAttributeName,nil]];
//    CGRect frame=_label.frame;
//    frame.size.height=size.height;
//    frame.size.width=size.width;
//    _label.frame=frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
