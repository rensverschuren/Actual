//
//  ContentViewController.h
//  playout
//
//  Created by Rens Verschuren on 30-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ContentViewController : NSViewController

@property (weak) IBOutlet NSView *contentView;
@property (strong) NSWindow *window;
@property (strong) NSManagedObject *item;

- (IBAction)browseFile:(id)sender;

@end
