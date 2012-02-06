//
//  PlayerView.m
//  playout
//
//  Created by Rens Verschuren on 01-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

@synthesize startColor = _startColor;
@synthesize endColor = _endColor;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{    
    
    
    _startColor = [NSColor colorWithSRGBRed:0.17 green:0.20 blue:0.24 alpha:1.0];    
    _endColor = [NSColor colorWithSRGBRed:0.40 green:0.44 blue:0.47 alpha:1.0];
    NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:_startColor endingColor:_endColor];    
    [gradient drawInRect:self.bounds angle:270.0];    
}

@end
