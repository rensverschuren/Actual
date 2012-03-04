      //
//  PreviewWindowController.m
//  Actual
//
//  Created by Rens Verschuren on 23-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreviewWindowController.h"

@implementation PreviewWindowController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize view = _view;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)awakeFromNib {
    //_managedObjectContext = [[self document] managedObjectContext];    
    //NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    //NSError *error = nil;
    //NSArray *items = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    //NSLog(@"%@", items);
    
    //setting the background color of the container layer to black
    //[_view setWantsLayer:YES];
    //_view.layer.frame = _view.bounds;
    //_view.layer.backgroundColor = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    //NSManagedObject *object = [items objectAtIndex:1];
    
    
    //NSURL *url = [NSURL URLWithString:[object valueForKey:@"filePath"]];
    //AVAsset *asset = [AVAsset assetWithURL:url];
    //AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    //AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    //AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    //[playerLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    //playerLayer.frame = _view.layer.bounds;
    //[player play];
    //[_view.layer addSublayer:playerLayer];    
}

@end
