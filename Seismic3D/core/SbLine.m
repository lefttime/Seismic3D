//
//  SbLine.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/15/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SbLine.h"

@interface SbLine() {
    GLKVector3 _position;
    GLKVector3 _direction;
}

@end

@implementation SbLine

- (id) init
{
    self = [super init];
    if (self) {
        _position = GLKVector3Make(0, 0, 0);
        _direction = GLKVector3Make(0, 0, 0);
    }
    
    return self;
}

- (void) setValueWithPoints:(GLKVector3)origin anotherPoint:(GLKVector3)point
{
    _position = origin;
    _direction = GLKVector3Normalize(GLKVector3Subtract(point, origin));
}

- (void) setPosDir:(GLKVector3)position direction:(GLKVector3)direction
{
    _position = position;
    _direction = direction;
}

- (BOOL) getClosetPoints:(SbLine*)line2 ptOnThis:(GLKVector3*)ptOnThis ptOnLine2:(GLKVector3*)ptOnLine2
{
    GLKVector3 p1 = _position;
    GLKVector3 p2 = [line2 getPosition];
    
    GLKVector3 d1 = _direction;
    GLKVector3 d2 = [line2 getDirection];
    
    GLKVector3 u = GLKVector3Subtract(p2, p1);
    float t = GLKVector3DotProduct(d1, d2);
    
    const float eps = 1.0e-06f;
    if (t < -1.0f + eps || t > 1.0f - eps) {
        return NO;
    }
    
    t = (GLKVector3DotProduct(u, d1) - t * GLKVector3DotProduct(u, d2)) / (1 - t*t);
    *ptOnThis = GLKVector3Add(p1, GLKVector3MultiplyScalar(d1, t));
    *ptOnLine2 = [line2 getClosetPoint:*ptOnThis];
    
    return YES;
}

- (GLKVector3) getClosetPoint:(GLKVector3)point
{
    return GLKVector3Add(_position, GLKVector3MultiplyScalar(_direction, GLKVector3DotProduct(GLKVector3Subtract(point, _position), _direction)));
}

- (GLKVector3) getPosition
{
    return _position;
}

- (GLKVector3) getDirection
{
    return _direction;
}

+ (void) setIntersectEpsilon:(const float)epsilon
{
    
}

@end
