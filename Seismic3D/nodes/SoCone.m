//
//  SoCone.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/26/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoCone.h"

@interface SoCone()

@property (assign) Part parts;
@property (assign) float bottomRadius;
@property (assign) float height;

@end

@implementation SoCone
@synthesize parts = _parts;
@synthesize bottomRadius = _bottomRadius;
@synthesize height = _height;

- (id) init
{
    self = [super init];
    if (self) {
        self.parts = All;
        self.bottomRadius = 1;
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
