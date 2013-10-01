//
//  SoLogicalViewportElement.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/6/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoElement.h"

@interface SoLogicalViewportElement : SoElement

@property (assign) CGSize size;

+ (SoLogicalViewportElement*) sharedInstance;

@end
