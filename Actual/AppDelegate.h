//
//  AppDelegate.h
//  Actual
//
//  Created by Rens Verschuren on 11-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PreferencesWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate, NSNetServiceDelegate>

@property (strong) NSNetService *netService;
@property (strong) PreferencesWindowController *preferencesWindowController;

- (IBAction)openPreferencesWindow:(id)sender;
- (void)startService;
- (void)stopService;

@end
