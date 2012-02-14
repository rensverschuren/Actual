//
//  NSArray+ACExtentions.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+ACExtensions.h"

@implementation NSArray (ACExtentions)

- (id)firstObject {
    if ([self count] == 0) {
        return nil;
    }
    else {
        return [self objectAtIndex:0];
    }
}

@end
