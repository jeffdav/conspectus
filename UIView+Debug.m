//
//  UIView+Hierarchy.m
//  Conspectus
//
//  Created by Jeffrey Davis on 2/27/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

#import "UIView+Debug.h"

#import <QuartzCore/QuartzCore.h>

#import "UIView+Hierarchy.h"

static UIColor *_debugOutlineColor;

@implementation UIView (Debug)

+ (void)load {
    if (self == [UIView class]) {
        _debugOutlineColor = [UIColor orangeColor];
    }
}

+ (void)setOutlineColor:(UIColor *)outlineColor {
    _debugOutlineColor = outlineColor;
}

- (void)outline {
    self.layer.borderColor = _debugOutlineColor.CGColor;
    self.layer.borderWidth = 1;
}

- (void)outlineHierarchy {
    [self applyBlockToSubviews:^(UIView *view, BOOL *stop) {
        [view outline];
    }];
}

@end
