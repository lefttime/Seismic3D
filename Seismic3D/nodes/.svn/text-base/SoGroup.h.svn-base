//
//  SoGroup.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/26/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoNode.h"

@interface SoGroup : SoNode

- (void) addChild:(SoNode*)child;
- (void) insertChild:(SoNode*)child position:(int)newChildIndex;

- (SoNode*) getChild:(int)index;

- (int) findChild:(SoNode*)child;

- (int) getNumChildren;

- (void) removeChildWithIndex:(int)index;
- (void) removeChildWithObject:(SoNode*)child;
- (void) removeAllChildren;

- (void) replaceChild:(SoNode*)oldChild object:(SoNode*)newChild;
- (void) replaceChildAt:(int)index object:(SoNode*)newChild;

@end
