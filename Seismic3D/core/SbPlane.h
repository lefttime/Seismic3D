//
//  SbPlane.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/15/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <GLKit/GLKit.h>

@class SbLine;

@interface SbPlane : NSObject

- (id)initWithThreePoints:(GLKVector3)p0 secondPoint:(GLKVector3)p1 thirdPoint:(GLKVector3)p2;
- (id)initWithNormalAndDistance:(GLKVector3)normal distance:(float)distance;
- (id)initWithNormalAndPoint:(GLKVector3)normal point:(GLKVector3)point;

- (void)offset:(float)d;
- (BOOL)intersect:(SbLine*)line intersection:(GLKVector3*)intersection;
- (BOOL)isInHalfSpace:(GLKVector3)point;
- (GLKVector3)getNormal;
- (float)getDistanceFromOrigin;
- (float)getDistance:(GLKVector3)point;

@end
