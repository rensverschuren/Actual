//
//  ItemsViewController.h
//  playout
//
//  Created by Rens Verschuren on 01-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ItemsViewController : NSViewController <NSOutlineViewDataSource, NSOutlineViewDelegate> 

@property (strong) NSManagedObjectContext *managedObjectContext;
@property (weak) IBOutlet NSOutlineView *outlineView;
@property (strong) IBOutlet NSTreeController *treeController;
@property (strong) NSArray *dragType;
@property (strong) NSTreeNode *draggedNode;

- (IBAction)newGroup:(id)sender;
- (IBAction)newLeaf:(id)sender;

@end
