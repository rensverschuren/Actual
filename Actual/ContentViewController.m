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
@synthesize player = _player;
@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil window:(NSWindow *)window
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib {     
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView:) name:@"itemOutlineViewSelectionDidChange" object:nil];
    [self setupPlayer];
}

- (void)updateView:(NSNotification *)notification {     
    NSTreeController *treeController = [notification object];
    NSArray *items = [treeController selectedObjects];
    if([items count] > 0) {
        [self setValue:[items objectAtIndex:0] forKey:@"item"];            
    }    
    [self setupPlayer];
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
            
            //setting up the player
            [self setupPlayer];            
        }
    }];
}

- (void)setupPlayer {    
    //disable core animation transactions, so the fade is gone
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
    
    //setting up the container view
    _contentView.wantsLayer = YES;    
    _contentView.layer.backgroundColor = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    
    //setting up the playable item
    NSURL *url = [NSURL URLWithString:[_item valueForKey:@"filePath"]];
    AVAsset *asset = [AVAsset assetWithURL:url];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    _player = [AVPlayer playerWithPlayerItem:playerItem];    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    
    //remove the previous playable item from the sublayer tree
    _contentView.layer.sublayers = nil;
    
    //add the new playerLayer
    [_contentView.layer addSublayer:playerLayer];
    playerLayer.frame = _contentView.layer.bounds;       
}

- (IBAction)play:(id)sender {
    [_player play];
}

- (IBAction)pause:(id)sender {
    [_player pause];
}

@end