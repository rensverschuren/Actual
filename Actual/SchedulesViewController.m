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
@synthesize item = _item;
@synthesize managedObjectContext = _managedObjectContext;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView:) name:@"itemOutlineViewSelectionDidChange" object:nil];
}

- (void)updateView:(NSNotification *)notification {     
    NSTreeController *treeController = [notification object];
    NSArray *items = [treeController selectedObjects];
    if([items count] > 0) {
        [self setValue:[items objectAtIndex:0] forKey:@"item"];            
    }    
}

@end
