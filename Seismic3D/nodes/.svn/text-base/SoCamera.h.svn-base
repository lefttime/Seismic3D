//
//  SoCamera.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/27/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoNode.h"

@interface SoCamera : SoNode

@property (assign, nonatomic) GLKVector3 position;
@property (assign, nonatomic) GLKQuaternion orientation;
@property (assign, nonatomic) float aspectRatio;
@property (assign, nonatomic) float nearDistance;
@property (assign, nonatomic) float farDistance;
@property (assign, nonatomic) float focalDistance;

- (void) pointAt:(GLKVector3)targetPoint;
- (void) viewAllWithObject:(SoNode*)sceneRoot;

@end
