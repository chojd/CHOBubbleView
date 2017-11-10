//
//  CHOBubbleView.h
//  CHOBubbleView
//
//  Created by Gene on 26/05/2017.
//  Copyright © 2017 OFashion. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kCHOBubbleDirectionLeft,
    kCHOBubbleDirectionRight,
} CHOBubbleDirection;

typedef struct CHOBubbleSpec {
    CGFloat arrowTop, arrowWidth, arrowHeight;
} CHOBubbleSpec;

UIKIT_STATIC_INLINE CHOBubbleSpec CHOBubbleSpecMake(CGFloat arrowTop, CGFloat arrowWidth, CGFloat arrowHeight) {
    CHOBubbleSpec spec = {arrowTop, arrowWidth, arrowHeight};
    return spec;
}

UIKIT_STATIC_INLINE BOOL CHOBubbleSpecEqualToBubbleSpec(CHOBubbleSpec spec1, CHOBubbleSpec spec2) {
    if (spec1.arrowTop    == spec2.arrowTop   &&
        spec1.arrowWidth  == spec2.arrowWidth &&
        spec1.arrowHeight == spec2.arrowHeight) {
        return YES;
    }
    return NO;
}

@interface CHOBubbleView : UIView

@property (nonatomic, assign) IBInspectable CGFloat radius;// default 5;
@property (nonatomic, assign) IBInspectable UIRectCorner corners; // default UIRectCornerAllCorners
@property (nonatomic, assign) IBInspectable CHOBubbleDirection direction;
@property (nonatomic, assign) IBInspectable CHOBubbleSpec bubbleSpec;// default {6.f, 3.f, 8.f}

@end
