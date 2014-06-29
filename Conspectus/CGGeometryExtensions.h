//
//  CGGeometryExtensions.h
//  ConspectusTest
//
//  Created by Jeffrey Davis on 6/28/14.
//  Copyright (c) 2014 Jeff Davis. All rights reserved.
//

#pragma once

#if !defined(CT_INLINE)
#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
#define CT_INLINE static inline
#elif defined(__cplusplus)
#define CT_INLINE static inline
#elif defined(__GNUC__)
#define CT_INLINE static __inline__
#else
#define CT_INLINE static
#endif
#endif

CT_INLINE CGFloat CTCenterSpan(CGFloat outer, CGFloat inner) {
    return roundf((outer - inner) / 2.0f);
}

CT_INLINE CGRect CTRectCenterInRect(CGRect outer, CGRect inner) {
    CGRect frame = inner;
    frame.origin.x = CTCenterSpan(CGRectGetWidth(outer), CGRectGetWidth(inner)) + CGRectGetMinX(outer);
    frame.origin.y = CTCenterSpan(CGRectGetHeight(outer), CGRectGetHeight(inner)) + CGRectGetMinY(outer);
    return frame;
}
