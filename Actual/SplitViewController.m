//
//  PrioritySplitViewDelegate.m
//  ColumnSplitView
//
//  Created by Matt Gallagher on 2009/09/01.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//

#import "SplitViewController.h"

@implementation SplitViewController

- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex {
    if(dividerIndex == 0) {
        //minimum width leftView when the left divider is moved
        return proposedMinimumPosition + 200.0;
    }
    else {
        //minimum width middleView when the left divider is moved
        return proposedMinimumPosition + 400.0;
    }
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat)proposedMaximumPosition ofSubviewAt:(NSInteger)dividerIndex {    
    if(dividerIndex == 1) {
        //minimum width rightView when the right divider is moved
        return proposedMaximumPosition - 276.0;
    }
    else {
        //minimum width middleView when the right divider is moved
        return proposedMaximumPosition - 400.0;
    }
}

//provides the rightView and leftView from resizing when the splitview resizes
- (BOOL)splitView:(NSSplitView *)splitView shouldAdjustSizeOfSubview:(NSView *)view {
    //get the index of the subview that's being dragged
    NSInteger index = [[splitView subviews] indexOfObject:view];
    
    if(index == 0 || index == 2) {
        return NO;
    }
    else {
        return YES;
    }
}

@end