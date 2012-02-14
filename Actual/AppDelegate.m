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

- (IBAction)openPreferencesWindow:(id)sender {
    PreferencesWindowController *preferencesWindowController = [[PreferencesWindowController alloc] initWithWindowNibName:@"Preferences"];
    [[preferencesWindowController window] center];    
    [preferencesWindowController showWindow:sender];    
}

@end
