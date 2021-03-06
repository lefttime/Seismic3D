//
//  SoCamera.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/27/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoCamera.h"

@implementation SoCamera
@synthesize position = _position;
@synthesize orientation = _orientation;
@synthesize aspectRatio = _aspectRatio;
@synthesize nearDistance = _nearDistance;
@synthesize farDistance = _farDistance;
@synthesize focalDistance = _focalDistance;

- (id) init
{
    self = [super init];
    if (self) {
        _position = GLKVector3Make(0, 0, 1);
        _orientation = GLKQuaternionMake(0, 0, 0, 1);
        _aspectRatio = 1.0f;
        _nearDistance = 1.0f;
        _farDistance = 10.0f;
        _focalDistance = 5.0f;
    }
    
    return self;
}

- (void) pointAt:(GLKVector3)targetPoint
{
    GLKVector3 direction = GLKVector3Subtract(targetPoint, self.position);
    self.focalDistance = GLKVector3Length(direction);
    
    direction = GLKVector3Normalize(direction);
    
    GLKVector3 axis = GLKVector3CrossProduct(GLKVector3Make(0, 0, -1), direction);
    float dot = GLKVector3DotProduct(GLKVector3Make(0, 0, -1), direction);
    float angle = acosf(dot);
    
    self.orientation = GLKQuaternionMakeWithAngleAndAxis(angle, axis.x, axis.y, axis.z);
}

- (void) viewAllWithObject:(SoNode*)sceneRoot
{
    
}

- (void) update
{
}

#pragma mark - slot Argument chagnged methods

- (void) setPosition:(GLKVector3)position
{
    _position = position;
    [self update];
}

- (void) setOrientation:(GLKQuaternion)orientation
{
    _orientation = orientation;
    [self update];
}

- (void) setAspectRatio:(float)aspectRatio
{
    _aspectRatio = aspectRatio;
    [self update];
}

- (void) setNearDistance:(float)nearDistance
{
    _nearDistance = nearDistance;
    [self update];
}

- (void) setFarDistance:(float)farDistance
{
    _farDistance = farDistance;
    [self update];
}

- (void) setFocalDistance:(float)focalDistance
{
    GLKVector3 dir = GLKQuaternionRotateVector3(self.orientation, GLKVector3Make(0, 0, -1));
    GLKVector3 distance = GLKVector3MultiplyScalar(GLKVector3Normalize(dir), self.focalDistance);
    GLKVector3 focalPoint = GLKVector3Add(self.position, distance);
    
    _focalDistance = focalDistance;
    distance = GLKVector3MultiplyScalar(GLKVector3Normalize(dir), self.focalDistance);
    _position = GLKVector3Subtract(focalPoint, distance);
}

@end
