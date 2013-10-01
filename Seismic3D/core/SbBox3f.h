//
//  SbBox3f.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/15/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <GLKit/GLKit.h>

@interface SbBox3f : NSObject

- (id) initWithValues:(float)xmin ymin:(float)ymin zmin:(float)zmin xmax:(float)xmax ymax:(float)ymax zmax:(float)zmax;
- (id) initWithCorner:(GLKVector3)minpt maxpt:(GLKVector3)maxpt;

- (GLKVector3) getMin;
- (GLKVector3) getMax;
- (GLKVector3) getCenter;

- (void) extendByPoint:(GLKVector3)point;
- (void) extendByBox3f:(SbBox3f*)box;

- (BOOL) intersectWithPoint:(GLKVector3)point;
- (BOOL) intersectWithBox3f:(SbBox3f*)box;

- (void) setBoundsByValues:(float)xmin ymin:(float)ymin zmin:(float)zmin xmax:(float)xmax ymax:(float)ymax zmax:(float)zmax;
- (void) getBoundsByValues:(float*)xmin ymin:(float*)ymin zmin:(float*)zmin xmax:(float*)xmax ymax:(float*)ymax zmax:(float*)zmax;

- (void) setBoundsByCorner:(GLKVector3)minpt maxpt:(GLKVector3)maxpt;
- (void) getBoundsByCorner:(GLKVector3*)minpt maxpt:(GLKVector3*)maxpt;

- (GLKVector3) getClosetPoint:(GLKVector3)point;
- (void) getOrigin:(float*)originX originY:(float*)originY originZ:(float*)originZ;
- (void) getSizeByValues:(float*)sizeX sizeY:(float*)sizeY sizeZ:(float*)sizeZ;
- (GLKVector3) getSize;

- (void) makeEmpty;
- (BOOL) isEmpty;
- (BOOL) hasVolume;

- (void) getSpan:(GLKVector3)dir dmin:(float*)dmin dmax:(float*)dmax;
- (float) getVolume;

@end
