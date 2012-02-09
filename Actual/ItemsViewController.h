//
//  ItemsViewController.h
//  playout
//
//  Created by Rens Verschuren on 01-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ItemsViewController : NSViewController <NSTableViewDelegate>

@property (strong) IBOutlet NSTableView *tableView;
@property (strong) NSManagedObjectContext *managedObjectContext;
@property NSInteger selectedRow;

@end
