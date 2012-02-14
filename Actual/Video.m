//
//  Video.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Video.h"

@implementation Video

- (NSImage *)image {  
    NSImage *image = [NSImage imageNamed:@"video"]; 
    NSImageRep *imageRep = [[image representations] objectAtIndex:0];
    [imageRep setSize:NSMakeSize(16.0, 16.0)];        
    return image;
}

@end
