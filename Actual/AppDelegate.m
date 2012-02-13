//
//  AppDelegate.m
//  Actual
//
//  Created by Rens Verschuren on 11-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (IBAction)openPreferencesWindow:(id)sender {
    NSWindowController *preferencesWindowController = [[NSWindowController alloc] initWithWindowNibName:@"Preferences"];
    [[preferencesWindowController window] center];    
    [preferencesWindowController showWindow:sender];    
}

@end
