//
//  PreferencesWindowController.m
//  Actual
//
//  Created by Rens Verschuren on 11-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferencesWindowController.h"
#import "GeneralViewController.h"
#import "AdvancedViewController.h"

@implementation PreferencesWindowController

@synthesize containerView = _containerView;
@synthesize generalViewController = _generalViewController;
@synthesize advancedViewController = _advancedViewController;

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

- (IBAction)changeView:(id)sender {
    
    //emptying the subviews array
    _containerView.subviews = [NSArray array];
    
    //getting the window frame
    NSRect windowFrame = self.window.frame;    
    
    switch ([sender tag]) {
        case 0:
            if(!_generalViewController) {
                _generalViewController = [[GeneralViewController alloc] initWithNibName:@"General" bundle:nil];                
            }                        
            float heightDifference0 = _generalViewController.view.frame.size.height - _containerView.frame.size.height;            
            windowFrame.size.height += heightDifference0;
            windowFrame.origin.y -= heightDifference0;
            [self.window setFrame:windowFrame display:YES animate:YES];
            //setting the window title
            [self.window setTitle:@"Preferences: General"];
            [_containerView addSubview:[_generalViewController view]];
            break;
            
        case 1:
            if(!_advancedViewController) {
                _advancedViewController = [[AdvancedViewController alloc] initWithNibName:@"Advanced" bundle:nil];
            }
            float heightDifference1 = _advancedViewController.view.frame.size.height - _containerView.frame.size.height;            
            windowFrame.size.height += heightDifference1;
            windowFrame.origin.y -= heightDifference1;
            [self.window setFrame:windowFrame display:YES animate:YES];     
            //setting the window title
            [self.window setTitle:@"Preferences: Advanced"];
            [_containerView addSubview:[_advancedViewController view]];
            break;
            
        default:
            break;
    }
}

@end