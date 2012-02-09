//
//  ItemsViewController.m
//  playout
//
//  Created by Rens Verschuren on 01-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"

@implementation ItemsViewController

@synthesize tableView = _tableView;
@synthesize selectedRow = _selectedRow;
@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {    
    NSTableView *tableView = [notification object];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"itemTableViewSelectionDidChange" object:tableView];
}

@end
