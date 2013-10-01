//
//  SoAmbientColorElement.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoAmbientColorElement.h"

@implementation SoAmbientColorElement
@synthesize color = _color;

static id _sharedInstance;

+ (void) initialize
{
    _sharedInstance = [[super alloc] initUniqueInstance];
}

+ (SoAmbientColorElement*) sharedInstance
{
    return _sharedInstance;
}

- (SoAmbientColorElement*) initUniqueInstance
{
    self = [super init];
    self.color = GLKVector4Make(0.2f, 0.2f, 0.2f, 1.0f);
    
    return self;
}

#pragma mark - SoElement methods

- (void) save
{
    [self.states addObject:[NSValue value:&_color withObjCType:@encode(GLKVector4)]];
}

- (void) restore
{
    [[self.states objectAtIndex:[self.states count]-1] getValue:&_color];
    [self.states removeLastObject];
}

@end
