//
//  SbBox3f.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/15/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SbBox3f.h"
#import <float.h>

@interface SbBox3f() {
    GLKVector3 _minpt;
    GLKVector3 _maxpt;
}

@end

@implementation SbBox3f

- (id) initWithValues:(float)xmin ymin:(float)ymin zmin:(float)zmin xmax:(float)xmax ymax:(float)ymax zmax:(float)zmax
{
    self = [super init];
    if (self) {
        _minpt = GLKVector3Make(xmin, ymin, zmin);
        _maxpt = GLKVector3Make(xmax, ymax, zmax);
    }
    
    return self;
}

- (id) initWithCorner:(GLKVector3)minpt maxpt:(GLKVector3)maxpt
{
    self = [super init];
    if (self) {
        _minpt = minpt;
        _maxpt = maxpt;
    }
    
    return self;
}

- (GLKVector3) getMin
{
    return _minpt;
}

- (GLKVector3) getMax
{
    return _maxpt;
}

- (GLKVector3) getCenter
{
    return GLKVector3MultiplyScalar(GLKVector3Add(_minpt, _maxpt), 0.5f);
}

- (void) extendByPoint:(GLKVector3)point
{
    if ([self isEmpty]) {
        [self setBoundsByCorner:point maxpt:point];
    } else {
        _minpt = GLKVector3Make(MIN(point.x, _minpt.x), MIN(point.y, _minpt.y), MIN(point.z, _minpt.z));
        _maxpt = GLKVector3Make(MAX(point.x, _maxpt.x), MAX(point.y, _maxpt.y), MAX(point.z, _maxpt.z));
    }
}

- (void) extendByBox3f:(SbBox3f*)box
{
    if ([box isEmpty]) {
        return;
    }
    
    if ([self isEmpty]) {
        _minpt = [box getMin];
        _maxpt = [box getMax];
    } else {
        [self extendByPoint:[box getMin]];
        [self extendByPoint:[box getMax]];
    }
}

- (BOOL) intersectWithPoint:(GLKVector3)point
{
    return !(point.x < _minpt.x ||
             point.x > _maxpt.x ||
             point.y < _minpt.y ||
             point.y > _maxpt.y ||
             point.z < _minpt.z ||
             point.z > _maxpt.z);
}

- (BOOL) intersectWithBox3f:(SbBox3f*)box
{
    if ([box getMax].x < _minpt.x ||
        [box getMax].y < _minpt.y ||
        [box getMax].z < _minpt.z ||
        [box getMin].x > _maxpt.x ||
        [box getMin].y > _maxpt.y ||
        [box getMin].z > _maxpt.z) {
        return NO;
    } else {
        return YES;
    }
}

- (void) setBoundsByValues:(float)xmin ymin:(float)ymin zmin:(float)zmin xmax:(float)xmax ymax:(float)ymax zmax:(float)zmax
{
    _minpt = GLKVector3Make(xmin, ymin, zmin);
    _maxpt = GLKVector3Make(xmax, ymax, zmax);
}

- (void) getBoundsByValues:(float*)xmin ymin:(float*)ymin zmin:(float*)zmin xmax:(float*)xmax ymax:(float*)ymax zmax:(float*)zmax
{
    *xmin = _minpt.x, *ymin = _minpt.y, *zmin = _minpt.z;
    *xmax = _maxpt.x, *ymax = _maxpt.y, *zmax = _maxpt.z;
}

- (void) setBoundsByCorner:(GLKVector3)minpt maxpt:(GLKVector3)maxpt
{
    _minpt = minpt;
    _maxpt = maxpt;
}

- (void) getBoundsByCorner:(GLKVector3*)minpt maxpt:(GLKVector3*)maxpt
{
    *minpt = _minpt;
    *maxpt = _maxpt;
}

- (GLKVector3) getClosetPoint:(GLKVector3)point
{
    GLKVector3 closest = point;
    
    GLKVector3 center = [self getCenter];
    float devx = closest.x - center.x;
    float devy = closest.y - center.y;
    float devz = closest.z - center.z;
    float halfwidth = (_maxpt.x - _minpt.x) * 0.5f;
    float halfheight= (_maxpt.y - _minpt.y) * 0.5f;
    float halfdepth = (_maxpt.z - _minpt.z) * 0.5f;
    
    if ((fabs(devx) > fabs(devy)) && (fabs(devx) > fabs(devz))) {
        closest.x = center.x + halfwidth * ((devx < 0.0f) ? -1.0f : 1.0f);
    } else if (fabs(devy) > fabs(devz)) {
        closest.y = center.y + halfheight * ((devy < 0.0f) ? -1.0f : 1.0f);
    } else {
        closest.z = center.z + halfdepth * ((devz < 0.0f) ? -1.0f : 1.0f);
    }
    
    closest.x = MIN(MAX(closest.x, _minpt.x), _maxpt.x);
    closest.y = MIN(MAX(closest.y, _minpt.y), _maxpt.y);
    closest.z = MIN(MAX(closest.z, _minpt.z), _maxpt.z);
    
    return closest;
}

- (void) getOrigin:(float*)originX originY:(float*)originY originZ:(float*)originZ
{
    *originX = _minpt.x, *originY = _minpt.y, *originZ = _minpt.z;
}

- (void) getSizeByValues:(float*)sizeX sizeY:(float*)sizeY sizeZ:(float*)sizeZ
{
    GLKVector3 size = [self getSize];
    *sizeX = size.x, *sizeY = size.y, *sizeZ = size.z;
}

- (GLKVector3) getSize
{
    if ([self isEmpty]) {
        return GLKVector3Make(0, 0, 0);
    }
    
    return GLKVector3Make(_maxpt.x-_minpt.x, _maxpt.y-_minpt.y, _maxpt.z-_minpt.z);
}

- (void) makeEmpty
{
    _minpt = GLKVector3Make( FLT_MAX,  FLT_MAX,  FLT_MAX);
    _maxpt = GLKVector3Make(-FLT_MAX, -FLT_MAX, -FLT_MAX);
}

- (BOOL) isEmpty
{
    return _maxpt.x < _minpt.x;
}

- (BOOL) hasVolume
{
    return ((_maxpt.x > _minpt.x) && (_maxpt.y > _minpt.y) && (_maxpt.z > _minpt.z));
}

- (void) getSpan:(GLKVector3)dir dmin:(float*)dmin dmax:(float*)dmax
{
    float dist;
    float mindist = FLT_MAX;
    float maxdist =-FLT_MAX;
    GLKVector3 points[2] = { _minpt, _maxpt };
    GLKVector3 corner;
    GLKVector3 normdir = GLKVector3Normalize(dir);
    if (GLKVector3Length(normdir) == 0.0f) {
        *dmin = *dmax = 0.0f;
        return;
    }
    
    for (int idx = 0; idx < 8; ++idx) {
        corner = GLKVector3Make(points[(idx&4)>>2].x, points[(idx&2)>>1].y, points[idx&1].z);
        dist = GLKVector3DotProduct(normdir, corner);
        mindist = MIN(mindist, dist);
        maxdist = MAX(maxdist, dist);
    }
    
    *dmin = mindist;
    *dmax = maxdist;
}

- (float) getVolume
{
    GLKVector3 size = [self getSize];
    return size.x * size.y * size.z;
}

@end
