//
//  DocumentWindowController.h
//  playout
//
//  Created by Rens Verschuren on 25-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@class SchedulesViewController;
@class ContentViewController;
@class PlayerViewController;
@class ItemsViewController;

@interface DocumentWindowController : NSWindowController

{
    IBOutlet NSView *_inspectorView;
    IBOutlet NSView *_middleView;
    SchedulesViewController *_schedulesViewController;
    ContentViewController *_contentViewController;
    PlayerViewController *_playerViewController;
    ItemsViewController *_itemsViewController;
    NSSegmentedControl *_inspectorToolbar;    
    IBOutlet NSSplitView *_splitView;
    IBOutlet NSTableView *mainTable;    
}

@property (strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)changeInspectorView:(id)sender;
- (void)action;

@end
