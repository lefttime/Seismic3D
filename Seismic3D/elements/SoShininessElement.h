//
//  SoShininessElement.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoReplacedElement.h"

@interface SoShininessElement : SoReplacedElement

@property (assign, nonatomic) float shininess;

+ (SoShininessElement*) sharedInstance;

@end
