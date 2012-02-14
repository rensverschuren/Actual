//
//  NSIndexPath+ACExtension.h
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSIndexPath (ACExtension)

- (NSUInteger)firstIndex;
- (NSUInteger)lastIndex;
- (NSIndexPath *)indexPathByIncrementingLastIndex;
- (NSIndexPath *)indexPathByReplacingIndexAtPosition:(NSUInteger)position withIndex:(NSUInteger)index;

@end
