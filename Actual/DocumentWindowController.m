//
//  DocumentWindowController.m
//  playout
//
//  Created by Rens Verschuren on 25-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DocumentWindowController.h"
#import "SchedulesViewController.h"
#import "ContentViewController.h"
#import "PlayerViewController.h"
#import "ItemsViewController.h"

@implementation DocumentWindowController

@synthesize itemsController = _itemsController;
@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {        
        
    }
    
    return self;
}

- (void)windowDidLoad
{   
    [super windowDidLoad];    
}

- (void)awakeFromNib {       
    _managedObjectContext = [[self document] managedObjectContext];
    
    //set the subviews of the splitview to minimum size -> displaying them
    [_splitView setPosition:-200.0 ofDividerAtIndex:0];
    [_splitView setPosition:300.0 ofDividerAtIndex:1];
    
    _schedulesViewController = [[SchedulesViewController alloc] initWithNibName:@"Schedules" bundle:nil];    
    _contentViewController = [[ContentViewController alloc] initWithNibName:@"Content" bundle:nil];    
    _playerViewController = [[PlayerViewController alloc] initWithNibName:@"Player" bundle:nil];
    _itemsViewController = [[ItemsViewController alloc] initWithNibName:@"Items" bundle:nil];  
    
    _itemsViewController.managedObjectContext = _managedObjectContext;    
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:@"itemTableViewSelectionDidChange" object:nil];    
}

- (void)action:(NSNotification *)notification {
    NSTableView *tableView = [notification object];
    
    if([tableView selectedRow] != -1) {
        NSLog(@"haaaaaaaaa %@", [_itemsController selectedObjects]);
    }
}

- (IBAction)changeInspectorView:(id)sender {
    //clearing the view's subviews array
    _inspectorView.subviews = [NSArray array];    
    
    NSRect frame = _inspectorView.bounds;
    
    //showing a progressIndicator when the nib loading takes too long
    CGRect progressIndicatorRect = CGRectMake(frame.size.width / 2.0 - 32.0, frame.size.height / 2.0 - 32.0, 32.0, 32.0);
    NSProgressIndicator *progressIndicator = [[NSProgressIndicator alloc] initWithFrame:progressIndicatorRect];
    [progressIndicator setStyle:NSProgressIndicatorSpinningStyle];
    [progressIndicator startAnimation:self];    
    [_inspectorView addSubview:progressIndicator]; 
    
    //showing the subview depending on the selected index of the inspectorToolbar
    NSInteger selectedControl = [sender selectedSegment];       
    
    switch (selectedControl) {
        case 0:            
            [_inspectorView addSubview:[_contentViewController view]];           
            break;
        case 1:
            [_inspectorView addSubview:[_schedulesViewController view]];
            break;
            
        default:
            break;
    }
    
    //selecting the inspector view's subview
    NSView *subView = [[_inspectorView subviews] objectAtIndex:1];    
    
    //setting the frame size
    CGFloat detailsWidth = frame.size.width + 2;
    CGFloat detailsHeight = frame.size.height;
    CGFloat detailsX = frame.origin.x - 1;
    CGFloat detailsY = frame.origin.y;    
    subView.frame = CGRectMake(detailsX, detailsY, detailsWidth, detailsHeight);
    subView.autoresizingMask = NSViewWidthSizable;
    
    //remove the progressIndicator from the inspector view    
    [progressIndicator removeFromSuperview];    
}

- (IBAction)changeMiddleView:(id)sender {  
    [_itemsController add:nil];
    _middleView.subviews = [NSArray array];
    [_middleView addSubview:[_itemsViewController view]];
    NSView *subView = [[_middleView subviews] objectAtIndex:0];
    subView.frame = _middleView.bounds;    
}

@end
