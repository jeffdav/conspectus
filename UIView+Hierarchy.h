//
//  UIView+Hierarchy.h
//  Conspectus
//
//  Created by Jeffrey Davis on 2/27/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Hierarchy)

// Traverses the view tree; returns the first instance of given class or nil.
- (UIView*)findFirstSubviewOfType:(Class)viewClass;

// Traverses the view tree; returns all instances of the given class or an empty array.
- (NSArray*)findSubviewsOfType:(Class)viewClass;

// Traverses the view tree; invokes the given block for each subview.  Set stop to YES to stop traversal.
- (void)applyBlockToSubviews:(void(^)(UIView* view, BOOL* stop))block;

// Traverses the view tree; invokes the given block for each subview of the given class.
- (void)applyBlockToSubviews:(void(^)(UIView* view, BOOL* stop))block ofClass:(Class)viewClass;

// Prints out the view tree; useful for debugging mainly.
- (NSString*)dumpTree;

@end