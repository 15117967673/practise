#import "ThemeImageView.h"
#import "ThemeManager.h"

@implementation ThemeImageView
{
    BOOL _isNeedStretch;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self loadThemeImage];
    }
    return self;
}

- (id)initWithImageName:(NSString *)imageName stretchable:(BOOL)stretch
{
    self = [super initWithFrame:CGRectZero];
    if (self != nil)
    {
        self.imageName = imageName;
        _isNeedStretch = stretch;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self loadThemeImage];        
    }
    return self;
}

- (void)loadThemeImage
{
    if(self.imageName.length == 0)
    {
        return;
    }
    
    UIImage *image = [[ThemeManager shareInstance] getThemeImage:self.imageName];
    
    if (_isNeedStretch)
    {
        image = [image stretchableImageWithLeftCapWidth:200 topCapHeight:20];
    }
    
    self.image = image;
}

- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    [_imageName release];
    [super dealloc];
}

@end