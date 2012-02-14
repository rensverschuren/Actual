//
//  Leaf.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Leaf.h"

@implementation Leaf

- (void)awakeFromInsert {
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"isGroup"];
}

@end
