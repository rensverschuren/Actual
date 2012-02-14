//
//  ItemsTreeController.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsTreeController.h"
#import "NSArray+ACExtensions.h"
#import "NSTreeController+ACExtensions.h"
#import "NSTreeNode+ACExtension.h"
#import "NSIndexPath+ACExtension.h"

@interface ItemsTreeController (Private)

- (void)updateSortOrderOfModelObjects;
    
@end

@implementation ItemsTreeController (Private)

- (void)updateSortOrderOfModelObjects;
{
	for (NSTreeNode *node in [self flattenedNodes]) {
		[[node representedObject] setValue:[NSNumber numberWithInt:[[node indexPath] lastIndex]] forKey:@"sortIndex"];
    }
}
@end

@implementation ItemsTreeController

- (void)insertObject:(id)object atArrangedObjectIndexPath:(NSIndexPath *)indexPath;
{
	[super insertObject:object atArrangedObjectIndexPath:indexPath];
	[self updateSortOrderOfModelObjects];
}

- (void)insertObjects:(NSArray *)objects atArrangedObjectIndexPaths:(NSArray *)indexPaths;
{
	[super insertObjects:objects atArrangedObjectIndexPaths:indexPaths];
	[self updateSortOrderOfModelObjects];
}

- (void)removeObjectAtArrangedObjectIndexPath:(NSIndexPath *)indexPath;
{
	[super removeObjectAtArrangedObjectIndexPath:indexPath];
	[self updateSortOrderOfModelObjects];
}

- (void)removeObjectsAtArrangedObjectIndexPaths:(NSArray *)indexPaths;
{
	[super removeObjectsAtArrangedObjectIndexPaths:indexPaths];
	[self updateSortOrderOfModelObjects];
}

- (void)moveNode:(NSTreeNode *)node toIndexPath:(NSIndexPath *)indexPath;
{
	[super moveNode:node toIndexPath:indexPath];
	[self updateSortOrderOfModelObjects];	
}

- (void)moveNodes:(NSArray *)nodes toIndexPath:(NSIndexPath *)indexPath;
{
	[super moveNodes:nodes toIndexPath:indexPath];
	[self updateSortOrderOfModelObjects];
}

@end
