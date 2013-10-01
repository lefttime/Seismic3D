//
//  SoCylinder.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/26/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoCylinder.h"

@interface SoCylinder()

@property (assign) Part parts;
@property (assign) float radius;
@property (assign) float height;

@end

@implementation SoCylinder
@synthesize parts = _parts;
@synthesize radius = _radius;
@synthesize height = _height;

- (id) init
{
    self = [super init];
    if (self) {
        self.parts = All;
        self.radius = 1;
        self.height = 2;
    }
    
    return self;
}

- (void) addPart:(Part)part
{
    self.parts |= part;
}

- (void) removePart:(Part)part
{
    self.parts &= ~part;
}

- (BOOL) hasPart:(Part)part
{
    return (self.parts & part) ? YES : NO;
}

@end
