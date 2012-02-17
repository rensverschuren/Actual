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
    
    //NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"text" ascending:YES];
    //[_treeController setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
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
    //[self reIndex];
    //to display the expand triangles
    [_outlineView reloadData];    
    NSLog(@"%@", [[_treeController arrangedObjects] childNodes]);
    return YES;
}

- (BOOL)category:(NSManagedObject *)cat isSubCategoryOf:(NSManagedObject *)possibleSub {
    if(cat == possibleSub) {
        return YES;
    }
    NSManagedObject *possSubParent = [possibleSub valueForKey:@"parent"];
    if(possSubParent == nil) {
        return NO;
    }
    
    while (possSubParent != nil) {
        if(possSubParent == cat) {
            return YES;
        }
        possSubParent = [possSubParent valueForKey:@"parent"];
    }
    return NO;
}

- (NSDragOperation)outlineView:(NSOutlineView *)outlineView validateDrop:(id<NSDraggingInfo>)info proposedItem:(id)item proposedChildIndex:(NSInteger)index {
    
    NSManagedObject *dragged = [_draggedNode representedObject];
    NSManagedObject *newP = [item representedObject];
    NSNumber *isGroup = [newP valueForKey:@"isGroup"];
    BOOL validTarget = [isGroup boolValue];
    
    //check if the possible parent is a group
    //checking if we are not dragging an item in one of its siblings (endless loop)
    if(![self category:dragged isSubCategoryOf:newP] && validTarget) {
        return NSDragOperationGeneric;        
    }
    else {   
        if([item representedObject] == nil) {
            //dragging operations to the root are allowed
            return NSDragOperationGeneric;
        }
        else {
            return NSDragOperationNone;
        }
    }
}

//- (void)reIndex {
//    NSUInteger count = [[_treeController arrangedObjects] count];
    //NSArray *array = [NSArray arrayWithArray:[_treeController ]];
    
//    for (int i = 0; i < count; i++) {
//        id item = [array objectAtIndex:i];
//        [item setValue:[NSNumber numberWithInt:i] forKey:@"sortIndex"];
//    }
//}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    return nil;
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
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Video" inManagedObjectContext:_managedObjectContext];
    NSManagedObject *item = [[Item alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_managedObjectContext]; 
}

- (IBAction)removeItem:(id)sender {
    //check if an item is selected
    if([_treeController selectionIndexPath]) {
        //remove the selected item from the _treeController
        [_treeController removeObjectAtArrangedObjectIndexPath:[_treeController selectionIndexPath]];
    }
}

@end
