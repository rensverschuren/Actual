//
//  Document.m
//  playout
//
//  Created by Rens Verschuren on 17-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Document.h"

@class DocumentWindowController;

@implementation Document

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, return nil.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (void)makeWindowControllers {
    DocumentWindowController *windowController = [[DocumentWindowController alloc] initWithWindowNibName:@"Document"];    
    [self addWindowController:windowController]; 
}

@end
