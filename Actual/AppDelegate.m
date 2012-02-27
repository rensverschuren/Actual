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

@synthesize netService = _netService;
@synthesize preferencesWindowController = _preferencesWindowController;

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [self startService];
}

- (IBAction)openPreferencesWindow:(id)sender {
    if(!_preferencesWindowController) {
        _preferencesWindowController = [[PreferencesWindowController alloc] initWithWindowNibName:@"Preferences"];             
    }
    [[_preferencesWindowController window] center];    
    [_preferencesWindowController showWindow:nil];    
}

- (void)startService {
    _netService = [[NSNetService alloc] initWithDomain:@"" type:@"_actualplayout._tcp." name:@"" port:5678];
    _netService.delegate = self;
    [_netService publish];
}

- (void)stopService {
    [_netService stop];
}

#pragma mark Delegate methods

- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict {
    NSLog(@"Didn't publish the service");
}

- (void)netServiceDidPublish:(NSNetService *)sender {
    NSLog(@"Service published");
}

@end
