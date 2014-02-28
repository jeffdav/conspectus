//
//  UIView+Hierarchy.m
//  TestApp
//
//  Created by Jeffrey Davis on 2/27/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

#import "UIView+Hierarchy.h"

@implementation UIView (Hierarchy)

- (UIView*)findFirstSubviewOfType:(Class)viewClass {
    NSMutableArray* subviews = [NSMutableArray arrayWithObject:self];
    while ([subviews count] > 0) {
        UIView* view = [subviews firstObject];
        [subviews removeObjectAtIndex:0];

        if ([view isKindOfClass:viewClass]) {
            return view;
        } else {
            [subviews addObjectsFromArray:[view subviews]];
        }
    }
    return nil;
}

- (NSArray*)findSubviewsOfType:(Class)viewClass {
    NSMutableArray* subviewsOfType = [NSMutableArray array];
    NSMutableArray* subviews = [NSMutableArray arrayWithObject:self];
    while ([subviews count] > 0) {
        UIView* view = [subviews firstObject];
        [subviews removeObjectAtIndex:0];

        if ([view isKindOfClass:viewClass]) {
            [subviewsOfType addObject:view];
        }
        [subviews addObjectsFromArray:[view subviews]];
    }
    return subviewsOfType;
}

- (void)applyBlockToSubviews:(void (^)(UIView *, BOOL *))block {
    return [self applyBlockToSubviews:block ofClass:nil];
}

- (void)applyBlockToSubviews:(void (^)(UIView *, BOOL *))block ofClass:(Class)viewClass {
    NSMutableArray* subviews = [NSMutableArray arrayWithObject:self];
    while ([subviews count] > 0) {
        UIView* view = [subviews firstObject];
        [subviews removeObjectAtIndex:0];

        BOOL stop = NO;
        if (viewClass == nil || [view isKindOfClass:viewClass]) {
            block(view, &stop);
            if (stop) {
                break;
            }
        }
        [subviews addObjectsFromArray:[view subviews]];
    }
}

@end
