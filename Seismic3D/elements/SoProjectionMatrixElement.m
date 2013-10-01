//
//  SoProjectionMatrixElement.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/28/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoProjectionMatrixElement.h"

@implementation SoProjectionMatrixElement
@synthesize matrix = _matrix;

static id _sharedInstance;

+ (void) initialize
{
    _sharedInstance = [[super alloc] initUniqueInstance];
}

+ (SoProjectionMatrixElement*) sharedInstance
{
    return _sharedInstance;
}

- (SoProjectionMatrixElement*) initUniqueInstance
{
    self = [super init];
    self.matrix = GLKMatrix4Identity;
    
    return self;
}

#pragma mark - SoElement methods

- (void) save
{
    [self.states addObject:[NSValue value:&_matrix withObjCType:@encode(GLKMatrix4)]];
}

- (void) restore
{
    [[self.states objectAtIndex:[self.states count]-1] getValue:&_matrix];
    [self.states removeLastObject];
}

@end
