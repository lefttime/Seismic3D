//
//  SoPerspectiveCamera.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/27/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoPerspectiveCamera.h"

#import "SoLogicalViewportElement.h"
#import "SoProjectionMatrixElement.h"
#import "SoModelViewMatrixElement.h"

@implementation SoPerspectiveCamera
@synthesize heightAngle = _heightAngle;

- (id) init
{
    self = [super init];
    if (self) {
        self.position = GLKVector3Make(0, 0, 1);
        self.orientation = GLKQuaternionMake(0, 0, 0, 1);
        self.aspectRatio = 1.0f;
        self.nearDistance = 1.0f;
        self.farDistance = 10.0f;
        self.focalDistance = 5.0f;
        self.heightAngle = 45.0f;
    }
    return self;
}

- (void) update
{
    CGSize viewSize = [[SoLogicalViewportElement sharedInstance] size];
    float aspect = fabsf(viewSize.width / viewSize.height) * self.aspectRatio;
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(self.heightAngle, aspect, self.nearDistance, self.farDistance);

    [[SoProjectionMatrixElement sharedInstance] clear];
    [[SoProjectionMatrixElement sharedInstance] setMatrix:projectionMatrix];
    
    GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(self.position.x, self.position.y, self.position.z);
    GLKMatrix4 rotation = GLKMatrix4MakeWithQuaternion(self.orientation);
    modelViewMatrix = GLKMatrix4Multiply(modelViewMatrix, rotation);
    modelViewMatrix = GLKMatrix4Invert(modelViewMatrix, 0);
    
    [[SoModelViewMatrixElement sharedInstance] clear];
    [[SoModelViewMatrixElement sharedInstance] setMatrix:modelViewMatrix];
}

#pragma mark - slot Argument chagnged methods

- (void) setHeightAngle:(float)heightAngle
{
    _heightAngle = heightAngle;
    [self update];
}

@end
