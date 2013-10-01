//
//  SoDrawStyleElement.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoDrawStyleElement.h"

@implementation SoDrawStyleElement
@synthesize style = _style;

static id _sharedInstance;

+ (void) initialize
{
    _sharedInstance = [[super alloc] initUniqueInstance];
}

+ (SoDrawStyleElement*) sharedInstance
{
    return _sharedInstance;
}

- (SoDrawStyleElement*) initUniqueInstance
{
    self = [super init];
    self.style = DrawStyleElement_Filled;
    
    return self;
}

#pragma mark - SoElement methods

- (void) save
{
    [self.states addObject:[NSValue value:&_style withObjCType:@encode(DrawStyleElement)]];
}

- (void) restore
{
    [[self.states objectAtIndex:[self.states count]-1] getValue:&_style];
    [self.states removeLastObject];
}

@end
