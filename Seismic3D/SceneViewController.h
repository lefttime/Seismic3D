//
//  SceneViewController.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/25/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <GLKit/GLKit.h>

@class SoNode;
@class SoCamera;

@interface SceneViewController : GLKViewController

typedef enum { Browser, Editor } SceneType;

typedef enum { Still, Interactive } SceneDrawType;

typedef enum {
    View_As_Is,
    View_Hidden_Line,
    View_No_Texture,
    View_Low_Complexity,
    View_Line,
    View_Point,
    View_BBox,
    View_Low_Res_Line,
    View_Low_Res_Point,
    View_Same_As_Still
} SceneDrawStyle;

@property (strong, nonatomic) SoNode* sceneGraph;
@property (strong, nonatomic) SoCamera* camera;

@property (assign) BOOL viewing;
@property (assign) BOOL autoClipping;

- (void) viewAll;

@end
