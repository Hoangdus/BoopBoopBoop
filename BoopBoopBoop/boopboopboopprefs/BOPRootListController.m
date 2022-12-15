#include "BOPRootListController.h"
#import  "spawn.h"

@implementation BOPRootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)respring:(id)sender{ //handle "respring" button
    pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

- (void)github{ //handle "github" button
  [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/Hoangdus/BoopBoopBoop"]options:@{} completionHandler:nil];
}

- (void)twitter{ //handle "twitter" button
  [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/Hoangdev23"]options:@{} completionHandler:nil];
}

- (void)paypal{ //handle "paypal" button
  [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.paypal.com/paypalme/HoangDus"]options:@{} completionHandler:nil];
}

@end

@implementation BOPHeaderCell

- (id)initWithSpecifier:(PSSpecifier *)specifier { // title
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];

  if (self) {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 60)];
    title.numberOfLines = 1;
    title.font = [UIFont systemFontOfSize:35];
    title.text = @"Boop Boop Boop";
    title.textColor = [UIColor colorWithRed:0.24 green:0.38 blue:0.8 alpha:1.0];
    title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:title];

    UILabel *subtitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, self.frame.size.width, 60)];
    subtitle.numberOfLines = 2;
    subtitle.font = [UIFont systemFontOfSize:20];
    subtitle.text = @"-Aurelion Sol \n By Hoangdus";
    subtitle.textColor = [UIColor grayColor];
    subtitle.textAlignment = NSTextAlignmentCenter;
	  [self addSubview:subtitle];
}
  return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
  return 150.0;
}
@end
