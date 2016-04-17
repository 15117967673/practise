#import "Tool.h"

@implementation Tool

+ (CGSize)heightOfString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)size lineBreakMode:(NSLineBreakMode)mode
{
    CGSize h;
    if (UIDevice.currentDevice.systemVersion.doubleValue >= 7.0)
    {
        NSDictionary *dic = @{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: font};
        h = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    }
    else
    {
        h = [str sizeWithFont:font constrainedToSize:size lineBreakMode:mode];
    }
    return h;
}

+ (void)showAlert
{
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"...", nil];
    [a show];
}

+ (NSString *)changeNumberToEnglish:(NSString *)str
{
    NSString *englishStr = nil;
    int a = str.intValue;
    switch (a) {
        case 1:
            englishStr = @"January";
            break;
            
        case 2:
            englishStr = @"February";
            break;
            
        case 3:
            englishStr = @"March";
            break;
            
        case 4:
            englishStr = @"April";
            break;
            
        case 5:
            englishStr = @"May";
            break;
            
        case 6:
            englishStr = @"June";
            break;
            
        case 7:
            englishStr = @"July";
            break;
            
        case 8:
            englishStr = @"August";
            break;
            
        case 9:
            englishStr = @"September";
            break;
            
        case 10:
            englishStr = @"October";
            break;
            
        case 11:
            englishStr = @"November";
            break;
            
        case 12:
            englishStr = @"December";
            break;
    }
    return englishStr;
}

@end