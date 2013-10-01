//
//  SoElement.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/28/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface SoElement : NSObject

@property (strong) NSMutableArray* states;

- (void) clear;
- (void) save;
- (void) restore;

@end
