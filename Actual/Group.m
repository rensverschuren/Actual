//
//  Group.m
//  Actual
//
//  Created by Rens Verschuren on 13-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Group.h"

@implementation Group

- (void)awakeFromInsert {
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isGroup"];
    [self setValue:@"New Group" forKey:@"text"];
}

- (NSImage *)image {  
    NSImage *image = [NSImage imageNamed:@"folder"];     
    NSImageRep *imageRep = [[image representations] objectAtIndex:0];
    [imageRep setSize:NSMakeSize(16.0, 16.0)];   
    return image;
}

@end
