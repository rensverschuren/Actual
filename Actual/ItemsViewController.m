//
//  ItemsViewController.m
//  playout
//
//  Created by Rens Verschuren on 01-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "Item.h"

@implementation ItemsViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize outlineView = _outlineView;
@synthesize treeController = _treeController;
@synthesize dragType = _dragType;
@synthesize draggedNode = _draggedNode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {   
    NSNotification *postedNotification = [NSNotification notificationWithName:@"itemOutlineViewSelectionDidChange" object:_treeController];
    [[NSNotificationCenter defaultCenter] postNotification:postedNotification];
}

- (void)awakeFromNib {
    _dragType = [NSArray arrayWithObject:@"factorialDragType"];
    [_outlineView registerForDraggedTypes:_dragType];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"text" ascending:YES];
    [_treeController setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

//- (BOOL)category:(NSManagedObject *)cat 

- (BOOL)outlineView:(NSOutlineView *)outlineView writeItems:(NSArray *)items toPasteboard:(NSPasteboard *)pasteboard {
    [pasteboard declareTypes:_dragType owner:self];
    _draggedNode = [items objectAtIndex:0];
    return YES;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView acceptDrop:(id<NSDraggingInfo>)info item:(id)item childIndex:(NSInteger)index {
    NSManagedObject *draggedTreeNode = [_draggedNode representedObject];
    [draggedTreeNode setValue:[item representedObject] forKey:@"parent"];
    return YES;
}

- (NSDragOperation)outlineView:(NSOutlineView *)outlineView validateDrop:(id<NSDraggingInfo>)info proposedItem:(id)item proposedChildIndex:(NSInteger)index {    
    NSManagedObject *object = [item representedObject];
    NSNumber *isGroup = [object valueForKey:@"isGroup"];
    BOOL validTarget = [isGroup boolValue];
    //check if the item is a group, when YES accept the drop.
    if(validTarget || [item representedObject] == nil) {
        return NSDragOperationGeneric;        
    }
    else {    
        return NSDragOperationNone;
    }
}

//required but useless methods-------------------------
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return YES;
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    return 1;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    return nil;
}
//-----------------------------------------------------

- (IBAction)newGroup:(id)sender {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Group" inManagedObjectContext:_managedObjectContext];
    NSManagedObject *item = [[Item alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_managedObjectContext];    
}

- (IBAction)newLeaf:(id)sender {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"QuartzComposition" inManagedObjectContext:_managedObjectContext];
    NSManagedObject *item = [[Item alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_managedObjectContext]; 
}

@end
