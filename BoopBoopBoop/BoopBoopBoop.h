#import <AudioToolbox/AudioServices.h>

int soundnumber[] = {0,1,2};

@interface SBUIController : NSObject
-(BOOL)isOnAC;
@end

@interface SBLockScreenManager : NSObject
-(BOOL)isUIUnlocking;
-(BOOL)isUILocked;
+(SBLockScreenManager *)sharedInstance;
@end

@interface SBCoverSheetPresentationManager : NSObject
+(id)sharedInstance;
-(BOOL)hasBeenDismissedSinceKeybagLock;
@end

NSURL *PCSoundURL;
NSURL *WPCSoundURL;
NSURL *PISoundURL;
NSURL *POSoundURL;
NSURL *LockSoundURL;
NSURL *UnLSoundURL;

UIImpactFeedbackGenerator *Clack;

NSInteger hardness;

static BOOL isPCEnable;
static BOOL isCustomPCSoundOn;
static BOOL isSinglePCSoundOn;
static int NofPCsounds;
static BOOL isWPCEnable;
static BOOL isCustomWPCSoundOn;
static BOOL isSingleWPCSoundOn;
static int NofWPCsounds;
static BOOL isUnLSEnable;
static BOOL isCustomUnLSoundOn;
static BOOL isSingleUnLSoundOn;
static int NofUnLSounds;
static BOOL isLSEnable;
static BOOL isCustomLSoundOn;
static BOOL isSingleLSoundOn;
static int NofLSounds;
static BOOL isPIEnable;
static BOOL isCustomPISoundOn;
static BOOL isSinglePISoundOn;
static int NofPIsounds;
static BOOL isPOEnable;
static BOOL isCustomPOSoundOn;
static BOOL isSinglePOSoundOn;
static int NofPOsounds;
static BOOL Clackingbuttons;
static int ClackingHardness;
