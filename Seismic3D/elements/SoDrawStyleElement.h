//
//  SoDrawStyleElement.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoInt32Element.h"

@interface SoDrawStyleElement : SoInt32Element

typedef enum {
    DrawStyleElement_Filled,
    DrawStyleElement_Lines,
    DrawStyleElement_Points,
    DrawStyleElement_Invisible,
    DrawStyleElement_Markers
} DrawStyleElement;

@property (assign) DrawStyleElement style;

+ (SoDrawStyleElement*) sharedInstance;

@end
