//
//  SchedulesViewController.m
//  playout
//
//  Created by Rens Verschuren on 25-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SchedulesViewController.h"
#import "DocumentWindowController.h"

@implementation SchedulesViewController

@synthesize status = _status;

@synthesize managedObjectContext = _managedObjectContext;
@synthesize itemsController = _itemsController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {   
        
    }
    
    return self;
}

- (void)awakeFromNib {
    NSRect frame = _status.bounds;
    NSImageView *imageView = [[NSImageView alloc] initWithFrame:frame];
    [imageView setImageScaling:NSScaleNone];
    [imageView setImage:[NSImage imageNamed:NSImageNameStatusAvailable]];
    [_status addSubview:imageView];
}

@end
