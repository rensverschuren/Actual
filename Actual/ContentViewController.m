//
//  ContentViewController.m
//  playout
//
//  Created by Rens Verschuren on 30-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContentViewController.h"

@implementation ContentViewController

@synthesize contentView = _contentView;
@synthesize window = _window;
@synthesize item = _item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil window:(NSWindow *)window
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib {
    _contentView.wantsLayer = YES;
    //set backgroundColor to black
    _contentView.layer.backgroundColor = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0); 
}

- (IBAction)browseFile:(id)sender {
    //configure openPanel
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:NO];
    
    //opening panel
    [panel beginSheetModalForWindow:_window completionHandler:^(NSInteger returnCode) {
        
        //if user clicks the OK button
        if(returnCode == NSOKButton) {
            //get filePath from array
            NSURL *url = [[panel URLs] objectAtIndex:0];
            //convert to string
            NSString *urlString = [url absoluteString];
            //write to selected item
            [_item setValue:urlString forKey:@"filePath"];
            
            NSLog(@"%@", [url path]);
        }
    }];
}

@end