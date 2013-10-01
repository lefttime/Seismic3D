//
//  SoDrawStyle.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoDrawStyle.h"
#import "SoDrawStyleElement.h"

@implementation SoDrawStyle
@synthesize style = _style;
@synthesize pointSize = _pointSize;
@synthesize lineWidth = _lineWidth;
@synthesize linePattern = _linePattern;
@synthesize linePatternScaleFactor = _linePatternScaleFactor;

- (void) render
{
    [[SoDrawStyleElement sharedInstance] setStyle:(DrawStyleElement)self.style];
}

@end
