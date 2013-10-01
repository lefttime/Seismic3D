//
//  SoGroup.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/26/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "SoGroup.h"

@interface SoGroup()

@property (strong) NSMutableArray* children;

@end

@implementation SoGroup
@synthesize children = _children;

- (id)init
{
    self = [super init];
    if (self) {
        self.children = [NSMutableArray array];
    }
    
    return self;
}

- (void) addChild:(SoNode*)child
{
    [self.children addObject:child];
}

- (void) insertChild:(SoNode*)child position:(int)newChildIndex
{
    [self.children insertObject:child atIndex:newChildIndex];
}

- (SoNode*) getChild:(int)index
{
    return [self.children objectAtIndex:index];
}

- (int) findChild:(SoNode*)child
{
    return [self.children indexOfObject:child];
}

- (int) getNumChildren
{
    return [self.children count];
}

- (void) removeChildWithIndex:(int)index
{
    [self.children removeObjectAtIndex:index];
}

- (void) removeChildWithObject:(SoNode*)child
{
    [self.children removeObject:child];
}

- (void) removeAllChildren
{
    [self.children removeAllObjects];
}

- (void) replaceChild:(SoNode*)oldChild object:(SoNode*)newChild
{
    NSUInteger index = [self findChild:oldChild];
    if (index != NSNotFound) {
        [self replaceChildAt:index object:newChild];
    }
}

- (void) replaceChildAt:(int)index object:(SoNode*)newChild
{
    [self.children replaceObjectAtIndex:index withObject:newChild];
}

#pragma mark - Base methods

- (void) update
{
    for (SoNode* child in self.children) {
        [child update];
    }
}

- (void) render
{
    for (SoNode* child in self.children) {
        [child render];
    }
}

@end
