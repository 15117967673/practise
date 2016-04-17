#import "ThemeLabel.h"
#import "ThemeManager.h"

@implementation ThemeLabel

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    [_colorName release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self setColor];
    }
    return self;
}

- (id)initWithColorName:(NSString *)colorName
{
    self = [super initWithFrame:CGRectZero];
    if (self != nil)
    {
        self.colorName = colorName;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self setColor];
    }
    
    return self;
}

- (void)setColor
{
    UIColor *textColor = [[ThemeManager shareInstance] getColorWithName:self.colorName];
    self.textColor = textColor;
}

- (void)themeNotification:(NSNotification *)notification
{
    [self setColor];
}

@end