//
//  AppDelegate.m
//  MacFirstApp
//
//  Created by Rahul on 15/09/14.
//  Copyright (c) 2014 Rahul. All rights reserved.
//

#import "AppDelegate.h"
#import "Track.h"
#import <CoreAudio/CoreAudio.h>



@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate



- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    
    
    Track *aTrack = [[Track alloc] init];
    [self setTrack:aTrack];
    [self updateUserInterface];
    
    
    AudioObjectPropertyAddress getDefaultOutputDevicePropertyAddress = {
        kAudioHardwarePropertyDefaultOutputDevice,
        kAudioObjectPropertyScopeGlobal,
        kAudioObjectPropertyElementMaster
    };
    
    AudioDeviceID defaultOutputDeviceID;
    UInt32 volumedataSize = sizeof(defaultOutputDeviceID);
    OSStatus result = AudioObjectGetPropertyData(kAudioObjectSystemObject,
                                                 &getDefaultOutputDevicePropertyAddress,
                                                 0, NULL,
                                                 &volumedataSize, &defaultOutputDeviceID);
    
    if(kAudioHardwareNoError != result)
    {
        // ... handle error ...
    }

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (IBAction)mute:(id)sender {
    [self.track setVolume:0.0];
    [self updateUserInterface];
}

- (IBAction)takeFloatValue:(id)sender {
    float newValue = [sender floatValue];
    [self.track setVolume: newValue];
    [self updateUserInterface];
}
- (void)updateUserInterface {
    
    float volume = [self.track volume];
    [self.volumed setFloatValue:volume];
    [self.slidrd setFloatValue:volume];
    [mus setVolume:volume];
}

- (IBAction)play:(id)sender
{
    mus = [[NSSound alloc]initWithContentsOfFile:[[NSBundle mainBundle]
                                                           pathForResource:@"Mauli" ofType:@".mp3"]byReference:NO];
    [mus play];
}


- (IBAction)stopp:(id)sender
{
    [mus stop];
}

- (IBAction)paused:(id)sender {
    [mus pause];
}

- (void)setVolume:(float)volume
{
    //[self.volumed setFloatValue:mus.volume];
    [mus setVolume:self.volumed.floatValue];
}
@end
