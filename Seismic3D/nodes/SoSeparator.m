//
//  SoSeparator.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoSeparator.h"

#import "SoProjectionMatrixElement.h"
#import "SoModelViewMatrixElement.h"

#import "SoAmbientColorElement.h"
#import "SoDiffuseColorElement.h"
#import "SoSpecularColorElement.h"
#import "SoEmissiveColorElement.h"
#import "SoShininessElement.h"
#import "SoTransparencyElement.h"
#import "SoDrawStyleElement.h"

@implementation SoSeparator

- (void) saveStates
{
    [[SoProjectionMatrixElement sharedInstance] save];
    [[SoModelViewMatrixElement sharedInstance] save];
    
    [[SoAmbientColorElement sharedInstance] save];
    [[SoDiffuseColorElement sharedInstance] save];
    [[SoSpecularColorElement sharedInstance] save];
    [[SoEmissiveColorElement sharedInstance] save];
    [[SoShininessElement sharedInstance] save];
    [[SoTransparencyElement sharedInstance] save];
    [[SoDrawStyleElement sharedInstance] save];
}

- (void) restoreStates
{
    [[SoDrawStyleElement sharedInstance] restore];
    [[SoTransparencyElement sharedInstance] restore];
    [[SoShininessElement sharedInstance] restore];
    [[SoEmissiveColorElement sharedInstance] restore];
    [[SoSpecularColorElement sharedInstance] restore];
    [[SoDiffuseColorElement sharedInstance] restore];
    [[SoAmbientColorElement sharedInstance] restore];
    
    [[SoModelViewMatrixElement sharedInstance] restore];
    [[SoProjectionMatrixElement sharedInstance] restore];
}

- (void) update
{
    [[SoProjectionMatrixElement sharedInstance] save];
    [[SoModelViewMatrixElement sharedInstance] save];
    
    int childCount = [self getNumChildren];
    for( int idx = 0; idx < childCount; ++idx ) {
        [[self getChild:idx] update];
    }
    
    [[SoModelViewMatrixElement sharedInstance] restore];
    [[SoProjectionMatrixElement sharedInstance] restore];
}

- (void) render
{
    [self saveStates];
    
    int childCount = [self getNumChildren];
    for( int idx = 0; idx < childCount; ++idx ) {
        [[self getChild:idx] render];
    }
    
    [self restoreStates];
}

@end
