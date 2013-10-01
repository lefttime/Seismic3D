//
//  ShaderHandler.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/6/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShaderHandler : NSObject

// Arguments: specify full filename, with extension
- (GLuint) setupShaderProgram:(NSString*)vs_filename fragmentFileName:(NSString*)fs_filename;

@end
