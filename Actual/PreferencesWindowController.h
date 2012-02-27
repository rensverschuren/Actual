//
//  PreferencesWindowController.h
//  Actual
//
//  Created by Rens Verschuren on 11-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class GeneralViewController;
@class AdvancedViewController;

@interface PreferencesWindowController : NSWindowController

@property (weak) IBOutlet NSView *containerView;
@property (strong) GeneralViewController *generalViewController;
@property (strong) AdvancedViewController *advancedViewController;

- (IBAction)changeView:(id)sender;

@end
