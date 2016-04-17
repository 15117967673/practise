#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *settingText;

@property (weak, nonatomic) IBOutlet UISwitch *settingSwitch;

@property (weak, nonatomic) IBOutlet UILabel *aboutText;

- (IBAction)settingSwitch:(id)sender;

@end