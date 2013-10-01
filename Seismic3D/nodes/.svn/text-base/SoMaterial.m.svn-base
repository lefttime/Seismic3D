//
//  SoMaterial.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoMaterial.h"

#import "SoAmbientColorElement.h"
#import "SoDiffuseColorElement.h"
#import "SoSpecularColorElement.h"
#import "SoEmissiveColorElement.h"
#import "SoShininessElement.h"
#import "SoTransparencyElement.h"

@implementation SoMaterial
@synthesize ambientColor = _ambientColor;
@synthesize diffuseColor = _diffuseColor;
@synthesize specularColor = _specularColor;
@synthesize emissiveColor = _emissiveColor;
@synthesize shininess = _shininess;
@synthesize transparency = _transparency;

- (id) init
{
    self = [super init];
    if (self) {
        self.ambientColor = GLKVector4Make(0.2f, 0.2f, 0.2f, 1.0f);
        self.diffuseColor = GLKVector4Make(0.8f, 0.8f, 0.8f, 1.0f);
        self.specularColor= GLKVector4Make(0.0f, 0.0f, 0.0f, 1.0f);
        self.emissiveColor= GLKVector4Make(0.0f, 0.0f, 0.0f, 1.0f);
        self.shininess = 0.2f;
        self.transparency = 0.0f;
    }
    return self;
}

- (void) update
{
    [[SoAmbientColorElement sharedInstance] setColor:self.ambientColor];
    [[SoDiffuseColorElement sharedInstance] setColor:self.diffuseColor];
    [[SoSpecularColorElement sharedInstance] setColor:self.specularColor];
    [[SoEmissiveColorElement sharedInstance] setColor:self.emissiveColor];
    [[SoShininessElement sharedInstance] setShininess:self.shininess];
    [[SoTransparencyElement sharedInstance] setTransparency:self.transparency];
}

@end
