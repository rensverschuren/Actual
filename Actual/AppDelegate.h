//
//  AppDelegate.h
//  Actual
//
//  Created by Rens Verschuren on 11-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PreferencesWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) PreferencesWindowController *preferencesWindowController;

- (IBAction)openPreferencesWindow:(id)sender;

@end