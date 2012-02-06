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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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

@end