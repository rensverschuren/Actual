//
//  NSIndexPath+ACExtension.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSIndexPath+ACExtension.h"

@implementation NSIndexPath (ACExtension)

- (NSUInteger)firstIndex;
{
	return [self indexAtPosition:0]; 
}

- (NSUInteger)lastIndex;
{
	return [self indexAtPosition:[self length] - 1];
}

- (NSIndexPath *)indexPathByIncrementingLastIndex;
{
	NSUInteger lastIndex = [self lastIndex];
	NSIndexPath *temp = [self indexPathByRemovingLastIndex];
	return [temp indexPathByAddingIndex:++lastIndex];
}

- (NSIndexPath *)indexPathByReplacingIndexAtPosition:(NSUInteger)position withIndex:(NSUInteger)index;
{
	NSUInteger indexes[[self length]];
	[self getIndexes:indexes];
	indexes[position] = index;
	return [[NSIndexPath alloc] initWithIndexes:indexes length:[self length]];
}

@end
