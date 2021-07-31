#include "BOPRootListController.h"

@implementation BOPSwitchCell
-(id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2 specifier:(id)arg3 {
    self = [super initWithStyle:arg1 reuseIdentifier:arg2 specifier:arg3];
    if (self) {
        [((UISwitch *)[self control]) setOnTintColor:[UIColor colorWithRed:0.24 green:0.38 blue:0.8 alpha:1.0]]; 
    }
    return self;
}
@end