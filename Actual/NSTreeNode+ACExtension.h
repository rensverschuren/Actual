//
//  NSTreeNode+ACExtension.h
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSTreeNode (ACExtension)

- (NSArray *)descendants;
- (NSArray *)groupDescendants;
- (NSArray *)leafDescendants;
- (NSArray *)siblings;
- (BOOL)isDescendantOfNode:(NSTreeNode *)node;
- (BOOL)isSiblingOfNode:(NSTreeNode *)node;
- (BOOL)isSiblingOfOrDescendantOfNode:(NSTreeNode *)node;
- (NSIndexPath *)adjacentIndexPath;
- (NSIndexPath *)nextSiblingIndexPath;
- (NSIndexPath *)nextChildIndexPath;

@end
