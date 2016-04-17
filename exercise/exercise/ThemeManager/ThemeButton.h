#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

@property (nonatomic,copy) NSString *imageName;

@property (nonatomic,copy) NSString *highligtImageName;

@property (nonatomic,copy) NSString *selectedImageName;

- (id)initWithImage:(NSString *)imageName highlighted:(NSString *)higlightImageName selected:(NSString *)selectedImageName;

- (id)initWithButtonTitle:(NSString *)title textTitle:(NSString *) textTitle startY:(CGFloat)startY imageName:(NSString *)imageName;

- (id)initWIthColorName:(NSString *)colorName;

@end