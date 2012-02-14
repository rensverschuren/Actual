//
//  QuartzComposition.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuartzComposition.h"

@implementation QuartzComposition

- (void)awakeFromInsert {
    [self setValue:@"New Quartz Composition" forKey:@"text"];
}

- (NSImage *)image {  
    NSImage *image = [NSImage imageNamed:@"quartz"]; 
    NSImageRep *imageRep = [[image representations] objectAtIndex:0];
    [imageRep setSize:NSMakeSize(32.0, 32.0)];        
    return image;
}

@end
