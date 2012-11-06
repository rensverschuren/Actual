//
//  AppDelegate.m
//  Actual
//
//  Created by Rens Verschuren on 11-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "PreferencesWindowController.h"

@implementation AppDelegate

@synthesize preferencesWindowController = _preferencesWindowController;

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    
}

- (IBAction)openPreferencesWindow:(id)sender {
    if(!_preferencesWindowController) {
        _preferencesWindowController = [[PreferencesWindowController alloc] initWithWindowNibName:@"Preferences"];             
    }
    [[_preferencesWindowController window] center];    
    [_preferencesWindowController showWindow:nil];    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end