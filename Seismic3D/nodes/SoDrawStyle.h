//
//  SoDrawStyle.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoNode.h"

@interface SoDrawStyle : SoNode

typedef enum {
    DrawStyle_Filled,
    DrawStyle_Lines,
    DrawStyle_Points,
    DrawStyle_Invisible
} DrawStyle;

@property (assign) DrawStyle        style;
@property (assign) float            pointSize;
@property (assign) float            lineWidth;
@property (assign) unsigned short   linePattern;
@property (assign) int              linePatternScaleFactor;

@end