//
//  NSTreeController+ACExtentions.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSTreeController+ACExtensions.h"
#import "NSTreeNode+ACExtension.h"
#import "NSIndexPath+ACExtension.h"
#import "NSArray+ACExtensions.h"

@implementation NSTreeController (ACExtentions)

// will create an NSIndexPath after the selection, or as for the top of the children of a group node
- (NSIndexPath *)indexPathForInsertion;
{
	NSUInteger rootTreeNodesCount = [[self rootNodes] count];
	NSArray *selectedNodes = [self selectedNodes];
	NSTreeNode *selectedNode = [selectedNodes firstObject];
	NSIndexPath *indexPath;
	
	if ([selectedNodes count] == 0)
		indexPath = [NSIndexPath indexPathWithIndex:rootTreeNodesCount];
	else if ([selectedNodes count] == 1) {
		if (![selectedNode isLeaf])
			indexPath = [[selectedNode indexPath] indexPathByAddingIndex:0];
		else {
			if ([selectedNode parentNode])
				indexPath = [selectedNode adjacentIndexPath];
			else
				indexPath = [NSIndexPath indexPathWithIndex:rootTreeNodesCount];
		}
	} else
		indexPath = [[selectedNodes lastObject] adjacentIndexPath];
	return indexPath;
}

// makes a blank selection in the outline view
- (void)selectNone;
{
	[self removeSelectionIndexPaths:[self selectionIndexPaths]];
}

- (NSArray *)rootNodes;
{
	return [[self arrangedObjects] childNodes];
}

- (NSTreeNode *)nodeAtIndexPath:(NSIndexPath *)indexPath;
{
	return [[self arrangedObjects] descendantNodeAtIndexPath:indexPath];
}

// all the real objects in the tree, depth-first searching
- (NSArray *)flattenedContent;
{
	NSMutableArray *mutableArray = [NSMutableArray array];
	for (id realNode in self.content) {
		[mutableArray addObject:realNode];
		if (![[realNode valueForKey:[self leafKeyPath]] boolValue])
			[mutableArray addObjectsFromArray:[realNode valueForKey:@"descendants"]];
	}
	return [mutableArray copy];
}

// all the NSTreeNodes in the tree, depth-first searching
- (NSArray *)flattenedNodes;
{
	NSMutableArray *mutableArray = [NSMutableArray array];
	for (NSTreeNode *node in [self rootNodes]) {
		[mutableArray addObject:node];
		if (![[node valueForKey:[self leafKeyPath]] boolValue])
			[mutableArray addObjectsFromArray:[node valueForKey:@"descendants"]];
	}
	return [mutableArray copy];	
}

- (NSTreeNode *)treeNodeForObject:(id)object;
{
	NSTreeNode *treeNode = nil;
	for (NSTreeNode *node in [self flattenedNodes]) {
		if ([node representedObject] == object) {
			treeNode = node;
			break;
		}
	}
	return treeNode;
}

- (void)selectParentFromSelection;
{
	if ([[self selectedNodes] count] == 0)
		return;
	
	NSTreeNode *parentNode = [[[self selectedNodes] firstObject] parentNode];
	if (parentNode)
		[self setSelectionIndexPath:[parentNode indexPath]];
	else
		// no parent exists (we are at the top of tree), so make no selection in our outline
		[self selectNone];
}

- (NSTreeNode *)nextSiblingOfNodeAtIndexPath:(NSIndexPath *)indexPath;
{
	return [[self arrangedObjects] descendantNodeAtIndexPath:[indexPath indexPathByIncrementingLastIndex]];
}

- (NSTreeNode *)nextSiblingOfNode:(NSTreeNode *)node;
{
	return [self nextSiblingOfNodeAtIndexPath:[node indexPath]];
}


@end
