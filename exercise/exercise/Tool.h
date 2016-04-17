#import <Foundation/Foundation.h>

@interface Tool : NSObject

+ (CGSize)heightOfString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)size lineBreakMode:(NSLineBreakMode)mode;

+ (void)showAlert;

+ (NSString *)changeNumberToEnglish:(NSString *)str;

@end