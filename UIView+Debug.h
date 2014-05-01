//
//  UIView+Hierarchy.h
//  Conspectus
//
//  Created by Jeffrey Davis on 2/27/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Debug)

// Sets the outline color for debugging.  Default is orange, because I like orange.
+ (void)setOutlineColor:(UIColor *)outlineColor;

// Outline the view.
- (void)outline;

// Outline the view and all descendents.
- (void)outlineHierarchy;

@end