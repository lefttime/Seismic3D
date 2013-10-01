//
//  SbLine.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/15/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <GLKit/GLKit.h>

@interface SbLine : NSObject

- (void) setValueWithPoints:(GLKVector3)origin anotherPoint:(GLKVector3)point;
- (void) setPosDir:(GLKVector3)position direction:(GLKVector3)direction;

- (BOOL) getClosetPoints:(SbLine*)line2 ptOnThis:(GLKVector3*)ptOnThis ptOnLine2:(GLKVector3*)ptOnLine2;
- (GLKVector3) getClosetPoint:(GLKVector3)point;

- (GLKVector3) getPosition;
- (GLKVector3) getDirection;

+ (void) setIntersectEpsilon:(const float)epsilon;

@end
