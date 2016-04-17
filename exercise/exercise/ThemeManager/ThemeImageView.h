#import <UIKit/UIKit.h>

@interface ThemeImageView : UIImageView

// 图片名称
@property(nonatomic,copy)NSString *imageName;

- (id)initWithImageName:(NSString *)imageName stretchable:(BOOL)stretch;

@end