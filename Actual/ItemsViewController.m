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
@synthesize managedObjectContext = _managedObjectContext;
@synthesize itemsController = _itemsController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {        
    [[NSNotificationCenter defaultCenter] postNotificationName:@"itemTableViewSelectionDidChange" object:_itemsController];    
}

@end
