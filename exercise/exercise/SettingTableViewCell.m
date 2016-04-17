#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (void)loadThemeImage
{
    self.backgroundColor = [[ThemeManager shareInstance] getColorWithName:@"bgColor"];
    _settingText.textColor = [[ThemeManager shareInstance] getColorWithName:@"default"];
    _aboutText.textColor = [[ThemeManager shareInstance] getColorWithName:@"default"];
}

- (void)awakeFromNib
{
    [self loadThemeImage];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadThemeImage) name:kThemeDidChangeNotification object:nil];
}

- (IBAction)settingSwitch:(id)sender
{
    switch ([sender tag])
    {
        case 10:
        {
            NSString *themeName = [ThemeManager shareInstance].themeName;
            
            if ([themeName isEqualToString:@"默认"])
            {
                themeName = @"nt";
            }
            else
            {
                themeName = @"默认";
            }
            
            [ThemeManager shareInstance].themeName = themeName;
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:nil];
            
            [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:kThemeName];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
            
        case 20:
            
            break;
            
        case 21:
            
            break;
            
            
        case 30:
            
            break;
            
            
        case 40:
            
            break;
            
        default:
            NSLog(@"11");
            break;
    }
}

@end