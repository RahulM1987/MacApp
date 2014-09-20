//
//  AppDelegate.h
//  MacFirstApp
//
//  Created by Rahul on 15/09/14.
//  Copyright (c) 2014 Rahul. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Track;


@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSSound * mus;
}

@property (weak) IBOutlet NSButton *mute;
- (IBAction)mute:(id)sender;
- (IBAction)takeFloatValue:(id)sender;
@property (weak) IBOutlet NSSliderCell *slidrd;
@property (strong) Track *track;
- (void)updateUserInterface;


@property (weak) IBOutlet NSTextField *volumed;

- (IBAction)play:(id)sender;

@property (weak) IBOutlet NSButton *stopp;
- (IBAction)stopp:(id)sender;

- (IBAction)paused:(id)sender;

@end

