#import "ThemeButton.h"
#import "ThemeManager.h"

@implementation ThemeButton
{
    NSString *_likeCount;
    NSString *_textTitle;
    BOOL _beSelected;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //监听主题切换的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self loadThemeImage];
    }
    return self;
}

- (id)initWithImage:(NSString *)imageName highlighted:(NSString *)highligtImageName selected:(NSString *)selectedImageName
{
    self = [super initWithFrame:CGRectZero];
    if (self != nil)
    {
        self.imageName = imageName;
        self.highligtImageName = highligtImageName;
        self.selectedImageName = selectedImageName;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self loadThemeImage];
    }
    return self;
}

- (id)initWithButtonTitle:(NSString *)title textTitle:(NSString *)textTitle startY:(CGFloat)startY imageName:(NSString *)imageName
{
    self = [super initWithFrame:CGRectZero];
    if (self != nil)
    {
        self.imageName = imageName;
        _textTitle = textTitle;
        _likeCount = title;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];

        CGFloat width = [Tool heightOfString:title font:[UIFont systemFontOfSize:10] maxSize:CGSizeMake(MAXFLOAT, 10) lineBreakMode:NSLineBreakByWordWrapping].width;
        
        self.frame = CGRectMake(kkScreenWidth - width - 30, startY + 20, width + 30, 20);
        
        [self loadThemeImage];
        
        // heart
        _beSelected = [[[NSUserDefaults standardUserDefaults] objectForKey:_textTitle] boolValue];
        
        UIImageView *heart = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 13, 12)];
        heart.image = [UIImage imageNamed: _beSelected ? @"home_like_hl" : @"home_like"];
        heart.tag = 10;
        [self addSubview:heart];
        
        // likeCount
        ThemeLabel *likeCount = [[ThemeLabel alloc] initWithColorName:@"default"];
        likeCount.tag = 20;
        likeCount.frame = CGRectMake(22, 0, self.frame.size.width - 20, 20);
        likeCount.text = _beSelected ? [NSString stringWithFormat:@"%d", title.integerValue + 1] : title;
        likeCount.font = [UIFont systemFontOfSize:12];
        likeCount.backgroundColor = [UIColor clearColor];
        [self addSubview:likeCount];
        
        [self addTarget:self action:@selector(pressLikeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - likeButtonAction
- (void)pressLikeButton:(UIButton *)btn
{
    UIImageView *iv = (UIImageView *)[self viewWithTag:10];
    UILabel *l = (UILabel *)[self viewWithTag:20];
    
    _beSelected = !_beSelected;
    
    iv.image = [UIImage imageNamed:_beSelected ? @"home_like_hl" : @"home_like"];
    
    l.text = _beSelected ? [NSString stringWithFormat:@"%d", _likeCount.integerValue + 1] : _likeCount;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(_beSelected) forKey:_textTitle];
    [defaults synchronize];
}

- (id)initWIthColorName:(NSString *)colorName
{
    self = [super initWithFrame:CGRectZero];
    if (self != nil)
    {
        self.imageName = colorName;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification) name:kThemeDidChangeNotification object:nil];
        
        [self setColor];
    }
    
    return self;
}

- (void)setColor
{
    UIColor *color = [[ThemeManager shareInstance] getColorWithName:self.imageName];
    
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (void)themeNotification
{
    [self setColor];
}

- (void)dealloc
{
    // 移除指定的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    [_imageName release];
    [_highligtImageName release];
    [super dealloc];
}

- (void)loadThemeImage
{
    ThemeManager *themeManager = [ThemeManager shareInstance];

    UIImage *image = [themeManager getThemeImage:self.imageName];
    UIImage *highligtImage = [themeManager getThemeImage:self.highligtImageName];
    UIImage *selectedImage = [themeManager getThemeImage:self.selectedImageName];
    
    if ([self.imageName isEqualToString:@"home_likeBg.png"])
    {
        image = [image stretchableImageWithLeftCapWidth:22 topCapHeight:25];
    }
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
    [self setBackgroundImage:highligtImage forState:UIControlStateHighlighted];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

#pragma mark - NSNotification actions
// 当切换主题时，会调用的方法
- (void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}

@end