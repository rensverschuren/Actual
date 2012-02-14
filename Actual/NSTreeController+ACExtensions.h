//
//  NSTreeController+ACExtentions.h
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTreeController (ACExtentions)

- (NSIndexPath *)indexPathForInsertion;
- (void)selectNone;
- (NSArray *)rootNodes;
- (NSTreeNode *)nodeAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)flattenedContent;
- (NSArray *)flattenedNodes;
- (NSTreeNode *)nextSiblingOfNodeAtIndexPath:(NSIndexPath *)indexPath;
- (NSTreeNode *)nextSiblingOfNode:(NSTreeNode *)node;
- (void)selectParentFromSelection;

@end
