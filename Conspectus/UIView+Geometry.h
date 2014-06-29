//
//  UIView+Geometry.h
//  ConspectusTest
//
//  Created by Jeffrey Davis on 6/28/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

@interface UIView (Geometry)

- (void)centerIn:(UIView*)view;

- (void)moveTo:(CGPoint)point;
- (void)moveTo:(CGPoint)point resizeTo:(CGSize)size;

- (void)resizeTo:(CGSize)size;

@end
