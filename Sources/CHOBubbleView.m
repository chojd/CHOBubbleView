//
//  CHOBubbleView.m
//  CHOBubbleView
//
//  Created by Gene on 26/05/2017.
//  Copyright © 2017 OFashion. All rights reserved.
//

#import "CHOBubbleView.h"

@implementation CHOBubbleView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialization];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    _radius = 5.f;
    _corners = UIRectCornerAllCorners;
    _direction = kCHOBubbleDirectionRight;
    _bubbleSpec = CHOBubbleSpecMake(6.f, 3.f, 8.f);
}

#pragma mark - Access
- (void)setCorners:(UIRectCorner)corners {
    if (_corners == corners) {
        return;
    }
    _corners = corners;
    [self setNeedsDisplay];
}

- (void)setDirection:(CHOBubbleDirection)direction {
    if (_direction == direction) {
        return;
    }
    _direction = direction;
    [self setNeedsDisplay];
}

- (void)setBubbleSpec:(CHOBubbleSpec)bubbleSpec {
    if (_bubbleSpec.arrowTop  == bubbleSpec.arrowTop &&
        _bubbleSpec.arrowWidth == bubbleSpec.arrowWidth &&
        _bubbleSpec.arrowHeight == bubbleSpec.arrowHeight) {
        return;
    }
    _bubbleSpec = bubbleSpec;
    [self setNeedsDisplay];
}

- (void)setRadius:(CGFloat)radius {
    if (_radius == radius) {
        return;
    }
    _radius = radius;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    // 以上边线中间点, 为起点, 按顺时针绘制 mask path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    switch (_direction) {
        case kCHOBubbleDirectionRight:
        {
            [bezierPath moveToPoint:CGPointMake(CGRectGetMidX(rect), 0)];// 上中间
            [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - _radius - _bubbleSpec.arrowWidth, 0)];
            [bezierPath addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - _radius - _bubbleSpec.arrowWidth, _radius) radius:_radius startAngle:-M_PI_2 endAngle:0 clockwise:YES];// 右上角
            [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - _bubbleSpec.arrowWidth, _radius + _bubbleSpec.arrowTop)];// 箭头
            [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect), _radius + _bubbleSpec.arrowTop + _bubbleSpec.arrowHeight / 2)];
            [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - _bubbleSpec.arrowWidth, _radius + _bubbleSpec.arrowTop + _bubbleSpec.arrowHeight)];
            [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - _bubbleSpec.arrowWidth, CGRectGetMaxY(rect) - _radius)];
            [bezierPath addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - _radius - _bubbleSpec.arrowWidth, CGRectGetMaxY(rect) - _radius) radius:_radius startAngle:0 endAngle:M_PI_2 clockwise:YES];// 右下角
            [bezierPath addLineToPoint:CGPointMake(_radius, CGRectGetMaxY(rect))];
            [bezierPath addArcWithCenter:CGPointMake(_radius, CGRectGetMaxY(rect) - _radius) radius:_radius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];// 左下角
            [bezierPath addLineToPoint:CGPointMake(0.f, _radius)];
            [bezierPath addArcWithCenter:CGPointMake(_radius, _radius) radius:_radius startAngle:M_PI_2 * 2 endAngle:M_PI_2 * 3 clockwise:YES];// 左上角
            [bezierPath closePath];
        }
            break;
        case kCHOBubbleDirectionLeft:
        default:
        {
            [bezierPath moveToPoint:CGPointMake(CGRectGetMidX(rect), 0)];// 上中间
            [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - _radius, 0)];
            [bezierPath addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - _radius, _radius) radius:_radius startAngle:-M_PI_2 endAngle:0 clockwise:YES];// 右上角
            [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect) - _radius)];
            [bezierPath addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - _radius, CGRectGetMaxY(rect) - _radius) radius:_radius startAngle:0 endAngle:M_PI_2 clockwise:YES];// 右下角
            [bezierPath addLineToPoint:CGPointMake(_radius + _bubbleSpec.arrowWidth, CGRectGetMaxY(rect))];
            [bezierPath addArcWithCenter:CGPointMake(_radius + _bubbleSpec.arrowWidth, CGRectGetMaxY(rect) - _radius) radius:_radius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];// 左下角
            [bezierPath addLineToPoint:CGPointMake(_bubbleSpec.arrowWidth, _radius + _bubbleSpec.arrowTop + _bubbleSpec.arrowHeight)];// 箭头
            [bezierPath addLineToPoint:CGPointMake(0.f, _radius + _bubbleSpec.arrowTop + _bubbleSpec.arrowHeight / 2.f)];
            [bezierPath addLineToPoint:CGPointMake(_bubbleSpec.arrowWidth, _radius + _bubbleSpec.arrowTop)];
            [bezierPath addLineToPoint:CGPointMake(_bubbleSpec.arrowWidth, _radius)];
            [bezierPath addArcWithCenter:CGPointMake(_radius + _bubbleSpec.arrowWidth, _radius) radius:_radius startAngle:M_PI_2 * 2 endAngle:M_PI_2 * 3 clockwise:YES];// 左上角
            [bezierPath closePath];
        }
            break;
    }
    
    [[UIColor clearColor] setStroke];
    bezierPath.lineWidth = 1.f;
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = bezierPath.CGPath;
    self.layer.mask = shapeLayer;
}

@end
