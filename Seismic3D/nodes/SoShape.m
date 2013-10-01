//
//  SoShape.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/26/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoShape.h"

@implementation SoShape

- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (BOOL) boundingBoxIgnoring
{
    return NO;
}

@end
