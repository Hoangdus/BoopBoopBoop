#import "BoopBoopBoop.h"

void preferencesthings(){ //pref (looks THICC)
	NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.hoangdus.boopboopboopprefs"];
	isPCEnable = (prefs && [prefs objectForKey:@"isPCEnable"] ? [[prefs valueForKey:@"isPCEnable"] boolValue] : YES );
	isCustomPCSoundOn = (prefs && [prefs objectForKey:@"isCustomPCSoundOn"] ? [[prefs valueForKey:@"isCustomPCSoundOn"] boolValue] : NO );
	isSinglePCSoundOn = (prefs && [prefs objectForKey:@"isSinglePCSoundOn"] ? [[prefs valueForKey:@"isSinglePCSoundOn"] boolValue] : NO );
	NofPCsounds = (prefs && [prefs objectForKey:@"NofPCsounds"] ? [[prefs valueForKey:@"NofPCsounds"] integerValue] : 0 );
	isWPCEnable = (prefs && [prefs objectForKey:@"isWPCEnable"] ? [[prefs valueForKey:@"isWPCEnable"] boolValue] : YES );
	isCustomWPCSoundOn = (prefs && [prefs objectForKey:@"isCustomWPCSoundOn"] ? [[prefs valueForKey:@"isCustomWPCSoundOn"] boolValue] : NO );
	isSingleWPCSoundOn = (prefs && [prefs objectForKey:@"isSingleWPCSoundOn"] ? [[prefs valueForKey:@"isSingleWPCSoundOn"] boolValue] : NO );
	NofWPCsounds = (prefs && [prefs objectForKey:@"NofWPCsounds"] ? [[prefs valueForKey:@"NofWPCsounds"] integerValue] : 0 );
	isUnLSEnable = (prefs && [prefs objectForKey:@"isUnLSEnable"] ? [[prefs valueForKey:@"isUnLSEnable"] boolValue] : YES );
	isCustomUnLSoundOn = (prefs && [prefs objectForKey:@"isCustomUnLSoundOn"] ? [[prefs valueForKey:@"isCustomUnLSoundOn"] boolValue] : NO );
	isSingleUnLSoundOn = (prefs && [prefs objectForKey:@"isSingleUnLSoundOn"] ? [[prefs valueForKey:@"isSingleUnLSoundOn"] boolValue] : NO );
	NofUnLSounds = (prefs && [prefs objectForKey:@"NofUnLSounds"] ? [[prefs valueForKey:@"NofUnLSounds"] integerValue] : 0 );
	isLSEnable = (prefs && [prefs objectForKey:@"isLSEnable"] ? [[prefs valueForKey:@"isLSEnable"] boolValue] : YES );
	isCustomLSoundOn = (prefs && [prefs objectForKey:@"isCustomLSoundOn"] ? [[prefs valueForKey:@"isCustomLSoundOn"] boolValue] : NO );
	isSingleLSoundOn = (prefs && [prefs objectForKey:@"isSingleLSoundOn"] ? [[prefs valueForKey:@"isSingleLSoundOn"] boolValue] : NO );
	NofLSounds = (prefs && [prefs objectForKey:@"NofLSounds"] ? [[prefs valueForKey:@"NofLSounds"] integerValue] : 0 );
	isPIEnable = (prefs && [prefs objectForKey:@"isPIEnable"] ? [[prefs valueForKey:@"isPIEnable"] boolValue] : YES );
	isCustomPISoundOn = (prefs && [prefs objectForKey:@"isCustomPISoundOn"] ? [[prefs valueForKey:@"isCustomPISoundOn"] boolValue] : NO );
	isSinglePISoundOn = (prefs && [prefs objectForKey:@"isSinglePISoundOn"] ? [[prefs valueForKey:@"isSinglePISoundOn"] boolValue] : NO );
	NofPIsounds = (prefs && [prefs objectForKey:@"NofPIsounds"] ? [[prefs valueForKey:@"NofPIsounds"] integerValue] : 0 );
	isPOEnable = (prefs && [prefs objectForKey:@"isPOEnable"] ? [[prefs valueForKey:@"isPOEnable"] boolValue] : YES );
	isCustomPOSoundOn = (prefs && [prefs objectForKey:@"isCustomPOSoundOn"] ? [[prefs valueForKey:@"isCustomPOSoundOn"] boolValue] : NO );
	isSinglePOSoundOn = (prefs && [prefs objectForKey:@"isSinglePOSoundOn"] ? [[prefs valueForKey:@"isSinglePOSoundOn"] boolValue] : NO );
	NofPOsounds = (prefs && [prefs objectForKey:@"NofPOsounds"] ? [[prefs valueForKey:@"NofPOsounds"] integerValue] : 0 );
    Clackingbuttons = (prefs && [prefs objectForKey:@"isClackingOn"] ? [[prefs valueForKey:@"isClackingOn"] boolValue] : NO );
    ClackingHardness = (prefs && [prefs objectForKey:@"Clackhardness"] ? [[prefs valueForKey:@"Clackhardness"] integerValue] : 0 );
}

//checking for eneko
NSString *Eneko = @"/usr/lib/Tweakinject/Eneko.dylib";

static void hapticpasscode() { //clacking button
    
	if (Clackingbuttons){
        if (ClackingHardness == 0){
			hardness = UIImpactFeedbackStyleLight;
		}
		if (ClackingHardness == 1){
			hardness = UIImpactFeedbackStyleMedium;
		}
		if (ClackingHardness == 2){
			hardness = UIImpactFeedbackStyleHeavy;
		}
        Clack = [[UIImpactFeedbackGenerator alloc] initWithStyle:(int)hardness];
        [Clack prepare];
        [Clack impactOccurred];
	}
}

%hook SBUIPasscodeLockViewBase //remove default keypad sound

-(void)setPlaysKeypadSounds:(BOOL)arg1{
    if ([[NSFileManager defaultManager]fileExistsAtPath:Eneko]){
		%orig;
	}else{
		if (isPCEnable){

	    }else{
		    %orig;
	    }
	}	
}

-(void)_sendDelegateKeypadKeyDown { //BOOP

    hapticpasscode();

	if (isPCEnable){
			PCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/ASolsounds/boop%d.mp3", arc4random_uniform(3)]];
        if (isSinglePCSoundOn){
	        PCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/ASolsounds/boop%d.mp3", soundnumber[NofPCsounds]]];
        }if (isCustomPCSoundOn){
	        PCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/PasscodeSounds/passcode%d.mp3", arc4random_uniform(NofPCsounds)]];
        }if (isSinglePCSoundOn && isCustomPCSoundOn){
	        PCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/PasscodeSounds/passcode%d.mp3", soundnumber[NofPCsounds]]];
        }
	    SystemSoundID sound = 0;
		AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain(PCSoundURL), &sound);
	    AudioServicesPlaySystemSound((SystemSoundID)sound);
	}else{
		%orig;
	}
}

%end

%hook SBUIController //charge sound plug in and pull out

-(void)ACPowerChanged{  
    %orig;
	if ([self isOnAC]){
		if (isPIEnable){
		    PISoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/Chargesounds/Oh_Yeah.mp3"]];
		    if(isSinglePISoundOn){
			    PISoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/Chargesounds/Oh_Yeah.mp3"]];
		    }if(isCustomPISoundOn){
                PISoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/ChargeSounds/plugin%d.mp3", arc4random_uniform(NofPIsounds)]];
		    }if(isSinglePISoundOn && isCustomPISoundOn){
                PISoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/ChargeSounds/plugin%d.mp3", soundnumber[NofPIsounds]]];
		    }
		    SystemSoundID sound = 0;
	        AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain(PISoundURL), &sound);
	        AudioServicesPlaySystemSound((SystemSoundID)sound);
		}else{
			
		}
	}else{		
		if (isPOEnable){
			POSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/Chargesounds/Put_it_back.mp3"]];
			if(isSinglePOSoundOn){
			    POSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/Chargesounds/Put_it_back.mp3"]];
		    }if(isCustomPOSoundOn){
                POSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/ChargeSounds/pullout%d.mp3", arc4random_uniform(NofPOsounds)]];
		    }if(isSinglePOSoundOn && isCustomPOSoundOn){
                POSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/ChargeSounds/pullout%d.mp3", soundnumber[NofPOsounds]]];
		    }
		    SystemSoundID sound = 0;
	        AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain(POSoundURL), &sound);
	        AudioServicesPlaySystemSound((SystemSoundID)sound);
		}else{
			
		}
	}
}

%end

%hook SBLockScreenManager //wrong passcode sound

-(void)attemptUnlockWithPasscode:(id)arg1 finishUIUnlock:(BOOL)arg2 completion:(id)arg3{ 
	%orig;
	if([self isUILocked]){     
	    if (isWPCEnable){        
	        WPCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/ASolsounds/taunt%d.mp3", arc4random_uniform(3)]];
            if (isSingleWPCSoundOn){
	            WPCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/ASolsounds/taunt%d.mp3", soundnumber[NofWPCsounds]]];
            }if (isCustomWPCSoundOn){
	            WPCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/WrongPasscodeSounds/wrongpasscode%d.mp3", arc4random_uniform(NofWPCsounds)]];
            }if (isSingleWPCSoundOn && isCustomWPCSoundOn){
	            WPCSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/WrongPasscodeSounds/wrongpasscode%d.mp3", soundnumber[NofWPCsounds]]];
            }
		    SystemSoundID sound = 0;
            AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain(WPCSoundURL), &sound);
            AudioServicesPlaySystemSound((SystemSoundID)sound);
		}else{

		}	
	}else{		
		
	}
}

%end

%hook SBCoverSheetPrimarySlidingViewController

-(void)viewWillDisappear:(BOOL)arg1{ //unlock sound

    Clack = nil;

    if (isUnLSEnable){
		UnLSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/LockAndUnlockSounds/unlock.mp3"]];
		if(isSingleUnLSoundOn){
			UnLSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/LockAndUnlockSounds/unlock.mp3"]];	
		}if(isCustomUnLSoundOn){
            UnLSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/UnlockSounds/unlock%d.mp3", arc4random_uniform(NofUnLSounds)]];
		}if(isSingleUnLSoundOn && isCustomUnLSoundOn){
            UnLSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/UnlockSounds/unlock%d.mp3", soundnumber[NofUnLSounds]]];
		}
		if ([[%c(SBCoverSheetPresentationManager)sharedInstance] hasBeenDismissedSinceKeybagLock]){
	        %orig;
		}else{
			SystemSoundID sound = 0;
            AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain(UnLSoundURL), &sound);
            AudioServicesPlaySystemSound((SystemSoundID)sound);
		}	
    }else{
		%orig;
    }		
}

%end

%hook SBSleepWakeHardwareButtonInteraction //lock sound

-(void)_playLockSound{ 
    if (isLSEnable){
		LockSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/ASolsounds/lock.mp3"]];
		if(isSingleLSoundOn){
			LockSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/PreferenceBundles/BoopBoopBoopPrefs.bundle/ASolsounds/lock.mp3"]];	
		}if(isCustomLSoundOn){
            LockSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/LockSounds/lock%d.mp3", arc4random_uniform(NofLSounds)]];
		}if(isSingleLSoundOn && isCustomLSoundOn){
            LockSoundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/var/mobile/Documents/CustomSounds/LockSounds/lock%d.mp3", soundnumber[NofLSounds]]];
		}
	    if ([[%c(SBLockScreenManager)sharedInstance] isUILocked]){ 
		    %orig;
	    }else{
	        SystemSoundID sound = 0;
            AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain(LockSoundURL), &sound);
            AudioServicesPlaySystemSound((SystemSoundID)sound);
	    }
    }else{
	    %orig;
    }
}

%end

%ctor {
	//more pref
	preferencesthings();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesthings, CFSTR("com.hoangdus.boopboopboopprefs-updated"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}