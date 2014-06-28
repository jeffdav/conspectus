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

- (NSString*)dumpTree:(UIView*)root depth:(NSUInteger)depth {
    NSString* string = [NSString stringWithFormat:@"%@%@\n", [@"" stringByPaddingToLength:depth withString:@" " startingAtIndex:0], root];
    for (int i = 0; i < [[root subviews] count]; ++i) {
        string = [string stringByAppendingString:[self dumpTree:[[root subviews] objectAtIndex:i] depth:depth + 1]];
    }
    return string;
}

- (NSString*)dumpTree {
    return [self dumpTree:self depth:0];
}

- (NSString*)dumpAncestors {
    NSMutableArray *ancestors = [NSMutableArray array];
    UIView* view = self;
    while (view) {
        [ancestors addObject:view];
        view = view.superview;
    }

    NSUInteger depth = 0;
    NSString* string = @"";

    for (int i = [ancestors count] - 1; i >= 0; i--) {
        UIView *v = ancestors[i];
        NSString *line = [NSString stringWithFormat:@"%@ %@ - %@\n",
                          [@"" stringByPaddingToLength:depth withString:@" " startingAtIndex:0],
                          NSStringFromClass([v class]),
                          NSStringFromCGRect(v.frame)];
        string = [string stringByAppendingString:line];
        depth++;
    }
    return string;
}

@end
