//
//  SoShininessElement.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoShininessElement.h"

@implementation SoShininessElement
@synthesize shininess = _shininess;

static id _sharedInstance;

+ (void) initialize
{
    _sharedInstance = [[super alloc] initUniqueInstance];
}

+ (SoShininessElement*) sharedInstance
{
    return _sharedInstance;
}

- (SoShininessElement*) initUniqueInstance
{
    self = [super init];
    self.shininess = 0.2f;
    
    return self;
}

#pragma mark - SoElement methods

- (void) save
{
    [self.states addObject:[NSNumber numberWithFloat:_shininess]];
}

- (void) restore
{
    _shininess = [[self.states objectAtIndex:[self.states count]-1] floatValue];
    [self.states removeLastObject];
}

@end
