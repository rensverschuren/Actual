//
//  PreviewWindowController.h
//  Actual
//
//  Created by Rens Verschuren on 23-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@interface PreviewWindowController : NSWindowController

@property (strong) NSManagedObjectContext *managedObjectContext;
@property (weak) IBOutlet NSView *view;

@end
