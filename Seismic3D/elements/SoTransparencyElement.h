//
//  SoTransparencyElement.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoReplacedElement.h"

@interface SoTransparencyElement : SoReplacedElement

@property (assign, nonatomic) float transparency;

+ (SoTransparencyElement*) sharedInstance;

@end
