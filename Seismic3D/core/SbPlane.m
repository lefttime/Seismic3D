//
//  SbPlane.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/15/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SbPlane.h"
#import "SbLine.h"

@interface SbPlane() {
    GLKVector3 _normal;
    float _distance;
}

@end

@implementation SbPlane

- (id)initWithThreePoints:(GLKVector3)p0 secondPoint:(GLKVector3)p1 thirdPoint:(GLKVector3)p2
{
    self = [super init];
    if (self) {
        _normal = GLKVector3Normalize(GLKVector3CrossProduct(GLKVector3Subtract(p1, p0), GLKVector3Subtract(p2, p0)));
        _distance = GLKVector3DotProduct(_normal, p0);
    }
    
    return self;
}

- (id)initWithNormalAndDistance:(GLKVector3)normal distance:(float)distance
{
    self = [super init];
    if (self) {
        _normal = normal;
        _distance = distance;
    }
    
    return self;
}

- (id)initWithNormalAndPoint:(GLKVector3)normal point:(GLKVector3)point
{
    self = [super init];
    if (self) {
        _normal = GLKVector3Normalize(normal);
        _distance = GLKVector3DotProduct(_normal, point);
    }
    
    return self;
}

- (void)offset:(float)d
{
    _distance += d;
}

- (BOOL)intersect:(SbLine*)line intersection:(GLKVector3*)intersection
{
    if (GLKVector3DotProduct([line getDirection], _normal) == 0.0f) {
        return NO;
    }
    
    float t = (_distance - GLKVector3DotProduct(_normal, [line getPosition])) / GLKVector3DotProduct(_normal, [line getDirection]);
    *intersection = GLKVector3Add([line getDirection], GLKVector3MultiplyScalar([line getDirection], t));
    
    return YES;
}

- (BOOL)isInHalfSpace:(GLKVector3)point
{
    return [self getDistance:point] >= 0.0f;
}

- (GLKVector3)getNormal
{
    return _normal;
}

- (float)getDistanceFromOrigin
{
    return _distance;
}

- (float)getDistance:(GLKVector3)point
{
    GLKVector3 dp = point;
    GLKVector3 dn = _normal;
    
    return GLKVector3DotProduct(dp, dn) - _distance;
}

@end
