//
//  SoTransform.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoTransform.h"

#import "SoModelViewMatrixElement.h"

@interface SoTransform() {
    GLKMatrix4 _modelViewMatrix;
}

@end

@implementation SoTransform
@synthesize translation = _translation;
@synthesize rotation = _rotation;
@synthesize scaleFactor = _scaleFactor;

- (id) init
{
    self = [super init];
    if (self) {
        self.translation = GLKVector3Make(0, 0, 0);
        self.rotation = GLKQuaternionMake(0, 0, 0, 1);
        self.scaleFactor = GLKVector3Make(1, 1, 1);
    }
    return self;
}

- (void) update
{
    _modelViewMatrix = GLKMatrix4Identity;
    GLKMatrix4 rotation = GLKMatrix4MakeWithQuaternion(self.rotation);
    
    _modelViewMatrix = GLKMatrix4Translate(_modelViewMatrix, self.translation.x, self.translation.y, self.translation.z);
    _modelViewMatrix = GLKMatrix4Multiply(_modelViewMatrix, rotation);
    _modelViewMatrix = GLKMatrix4Scale(_modelViewMatrix, self.scaleFactor.x, self.scaleFactor.y, self.scaleFactor.z);

    GLKMatrix4 baseModelViewMatrix = [[SoModelViewMatrixElement sharedInstance] matrix];
    _modelViewMatrix = GLKMatrix4Multiply(baseModelViewMatrix, _modelViewMatrix);
    [[SoModelViewMatrixElement sharedInstance] setMatrix:_modelViewMatrix];
}

#pragma mark - slot Argument chagnged methods

- (void) setTranslation:(GLKVector3)translation
{
    _translation = translation;
    [self update];
}

- (void) setRotation:(GLKQuaternion)rotation
{
    _rotation = rotation;
    [self update];
}

- (void) setScaleFactor:(GLKVector3)scaleFactor
{
    _scaleFactor = scaleFactor;
    [self update];
}

@end
