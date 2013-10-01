//
//  SoSpecularColorElement.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/7/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoReplacedElement.h"

@interface SoSpecularColorElement : SoReplacedElement

@property (assign, nonatomic) GLKVector4 color;

+ (SoSpecularColorElement*) sharedInstance;

@end
