//
//  WheelView.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/9/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "WheelView.h"
#import <QuartzCore/QuartzCore.h>
#import "SpinGestureRecognizer.h"

@interface WheelView()

@property (nonatomic, assign) CGFloat currentAngle;

@end

@implementation WheelView
@synthesize dataSource = _dataSource;
@synthesize style = _style;
@synthesize currentAngle = _currentAngle;

- (void)commonInit
{
    [self setCurrentAngle:0.0];
    
    SpinGestureRecognizer* spin = [[SpinGestureRecognizer alloc] initWithTarget:self action:@selector(spin:)];
    [self addGestureRecognizer:spin];
}

- (void)setStyle:(WheelViewStyle)style
{
    if (_style != style) {
        _style = style;
        
        [UIView beginAnimations:@"WheelViewStyleChange" context:nil];
        [self setAngle:self.currentAngle];
        [UIView commitAnimations];
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)setAngle:(CGFloat)angle
{
    CGPoint center = CGPointMake(CGRectGetMidX([self bounds]), CGRectGetMidY([self bounds]));
    CGFloat radiusX = MIN([self bounds].size.width, [self bounds].size.height) * 0.35;
    CGFloat radiusY = radiusX;
    if ([self style] == WheelViewStyleCarousel) {
        radiusY = radiusX * 0.30;
    }
    
    NSInteger cellCount = [[self dataSource] wheelViewNumberOfCells:self];
    float angleToAdd = 360.0f / cellCount;
    
    for (NSInteger index = 0; index < cellCount; ++index) {
        WheelViewCell* cell = [[self dataSource] wheelView:self cellAtIndex:index];
        if ([cell superview] == nil) {
            [self addSubview:cell];
        }
        
        float angleInRadians = (angle + 180.0) * M_PI / 180.0f;
        
        float xPosition = center.x + (radiusX * sinf(angleInRadians)) - (CGRectGetWidth([cell frame]) / 2);
        float yPosition = center.y + (radiusY * cosf(angleInRadians)) - (CGRectGetHeight([cell frame]) / 2);
        
        float scale = 0.75f + 0.25f * (cosf(angleInRadians) + 1.0);
        if ([self style] == WheelViewStyleCarousel) {
            [cell setTransform:CGAffineTransformScale(CGAffineTransformMakeTranslation(xPosition, yPosition), scale, scale)];
            [cell setAlpha:(0.3f + 0.5f * (cosf(angleInRadians) + 1.0))];
        } else {
            [cell setTransform:CGAffineTransformMakeTranslation(xPosition, yPosition)];
            [cell setAlpha:1.0f];
        }
        
        [[cell layer] setZPosition:scale];
        
        angle += angleToAdd;
    }
}

- (void)layoutSubviews
{
    [self setAngle:self.currentAngle];
}

- (void)spin:(SpinGestureRecognizer*)recognizer
{
    CGFloat angleInRadians = -[recognizer rotation];
    CGFloat degrees = 180.0 * angleInRadians / M_PI;
    [self setCurrentAngle:self.currentAngle + degrees];
    [self setAngle:self.currentAngle];
}

@end

@implementation WheelViewCell

@end
