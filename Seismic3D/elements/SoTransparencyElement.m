//
//  SoTransparencyElement.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoTransparencyElement.h"

@implementation SoTransparencyElement
@synthesize transparency = _transparency;

static id _sharedInstance;

+ (void) initialize
{
    _sharedInstance = [[super alloc] initUniqueInstance];
}

+ (SoTransparencyElement*) sharedInstance
{
    return _sharedInstance;
}

- (SoTransparencyElement*) initUniqueInstance
{
    self = [super init];
    self.transparency = 0.0f;
    
    return self;
}

#pragma mark - SoElement methods

- (void) save
{
    [self.states addObject:[NSNumber numberWithFloat:_transparency]];
}

- (void) restore
{
    _transparency = [[self.states objectAtIndex:[self.states count]-1] floatValue];
    [self.states removeLastObject];
}

@end
