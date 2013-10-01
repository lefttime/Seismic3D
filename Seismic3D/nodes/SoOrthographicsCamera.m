//
//  SoOrthographicsCamera.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/27/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoOrthographicsCamera.h"

#import "SoLogicalViewportElement.h"
#import "SoProjectionMatrixElement.h"
#import "SoModelViewMatrixElement.h"

@interface SoOrthographicsCamera()

@property (assign) float height;

@end

@implementation SoOrthographicsCamera
@synthesize height = _height;

- (id) init
{
    self = [super init];
    if (self) {
        self.position = GLKVector3Make(0, 0, 1);
        self.aspectRatio = 1.0f;
        self.nearDistance = 1.0f;
        self.farDistance = 10.0f;
        self.height = 2.0f;
    }
    
    return self;
}

- (void) update
{
    float scaleHeight = self.height;
    float scaleWidth = self.height * self.aspectRatio;
    GLKMatrix4 projectionMatrix = GLKMatrix4MakeOrtho(-scaleWidth*0.5f, scaleWidth*0.5f, -scaleHeight*0.5f, scaleHeight*0.5f, self.nearDistance, self.farDistance);
    
    [[SoProjectionMatrixElement sharedInstance] clear];
    [[SoProjectionMatrixElement sharedInstance] setMatrix:projectionMatrix];
    
    GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(self.position.x, self.position.y, self.position.z);
    GLKMatrix4 rotation = GLKMatrix4MakeWithQuaternion(self.orientation);
    modelViewMatrix = GLKMatrix4Multiply(modelViewMatrix, rotation);
    modelViewMatrix = GLKMatrix4Invert(modelViewMatrix, 0);
    
    [[SoModelViewMatrixElement sharedInstance] clear];
    [[SoModelViewMatrixElement sharedInstance] setMatrix:modelViewMatrix];
}

@end
