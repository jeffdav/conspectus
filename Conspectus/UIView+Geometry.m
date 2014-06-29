//
//  UIView+Geometry.m
//  ConspectusTest
//
//  Created by Jeffrey Davis on 6/28/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

#import "UIView+Geometry.h"

@implementation UIView (Geometry)

- (void)centerIn:(UIView *)view {
    self.frame = CTRectCenterInRect(view.bounds, self.frame);
}

- (void)moveTo:(CGPoint)point {
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}

- (void)moveTo:(CGPoint)point resizeTo:(CGSize)size {
    CGRect frame = self.frame;
    frame.origin = point;
    frame.size = size;
    self.frame = frame;
}

- (void)resizeTo:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
