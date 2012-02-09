//
//  SchedulesViewController.h
//  playout
//
//  Created by Rens Verschuren on 25-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DocumentWindowController;

@interface SchedulesViewController : NSViewController

@property (weak) IBOutlet NSView *status;
@property (weak) NSArrayController *schedulesController;

- (void)action;

@end
