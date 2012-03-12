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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"selectedObjects"]) {        
        NSNotification *postedNotification = [NSNotification notificationWithName:@"itemOutlineViewSelectionDidChange" object:_treeController];
        [[NSNotificationCenter defaultCenter] postNotification:postedNotification];
    }    
}

- (void)awakeFromNib {    
    _dragType = [NSArray arrayWithObject:@"factorialDragType"];
    [_outlineView registerForDraggedTypes:_dragType];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortIndex" ascending:YES];
    [_treeController setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    [_outlineView setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    [_treeController addObserver:self forKeyPath:@"selectedObjects" options:NSKeyValueObservingOptionNew context:nil];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView writeItems:(NSArray *)items toPasteboard:(NSPasteboard *)pasteboard {
    [pasteboard declareTypes:_dragType owner:self];
    _draggedNode = [items objectAtIndex:0];
    return YES;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView acceptDrop:(id<NSDraggingInfo>)info item:(id)item childIndex:(NSInteger)index {   
    //when dragged to the root, set empty index path
    NSIndexPath *proposedParentIndexPath = (item) ? [item indexPath] : [[NSIndexPath alloc] init];      
    
    //if the dragged node is not specifically positioned within it's proposed parent, set position to 0
    index = (index < 0) ? 0 : index;
    
    //move the node to the new location (index path)
    [_treeController moveNode:_draggedNode toIndexPath:[proposedParentIndexPath indexPathByAddingIndex:index]];       
    
    //setting the new parent for the dragged node
    NSManagedObject *draggedObject = [_draggedNode representedObject];
    [draggedObject setValue:[item representedObject] forKey:@"parent"];
    
    //reset the sortIndex of the whole tree
    [self reIndex];    
    
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
        if([item representedObject] == nil && index != -1) {
            //dragging operations to the root are always allowed
            return NSDragOperationGeneric;
        }
        else {
            return NSDragOperationNone;
        }
    }    
}

- (void)reIndex {
    [_outlineView reloadData];
}

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
    [self reIndex];  
    [_outlineView reloadData]; 
}

- (IBAction)newLeaf:(id)sender {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"QuartzComposition" inManagedObjectContext:_managedObjectContext];
    NSManagedObject *item = [[Item alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_managedObjectContext]; 
    [self reIndex];    
}

- (IBAction)removeItem:(id)sender {
    //check if an item is selected
    if([_treeController selectionIndexPath]) {
        //remove the selected item from the _treeController
        [_treeController removeObjectAtArrangedObjectIndexPath:[_treeController selectionIndexPath]];
        
        [self reIndex];
    }
}

@end
