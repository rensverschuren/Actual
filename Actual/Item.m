//
//  Item.m
//  Actual
//
//  Created by Rens Verschuren on 07-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize image;

- (NSString *)urlShort {
    NSURL *url = [NSURL URLWithString:[self valueForKeyPath:@"filePath"]];
    return [url path];
}

@end
