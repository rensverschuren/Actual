//
//  ContentViewController.h
//  playout
//
//  Created by Rens Verschuren on 30-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@interface ContentViewController : NSViewController

@property (weak) IBOutlet NSView *contentView;
@property (strong) NSWindow *window;
@property (strong) NSManagedObject *item;
@property (strong) AVPlayer *player;
@property (strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)browseFile:(id)sender;
- (void)updateView:(NSNotification *)notification;
- (void)setupPlayer;
- (IBAction)play:(id)sender;
- (IBAction)pause:(id)sender;

@end
