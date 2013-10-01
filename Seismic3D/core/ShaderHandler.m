//
//  ShaderHandler.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 6/6/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "ShaderHandler.h"

@implementation ShaderHandler

- (GLuint) setupShaderProgram:(NSString*)vs_filename fragmentFileName:(NSString*)fs_filename
{
    GLuint vShader = [self compileShader:vs_filename withType:GL_VERTEX_SHADER];
    GLuint fShader = [self compileShader:fs_filename withType:GL_FRAGMENT_SHADER];
    
    GLuint programHandle = glCreateProgram();
    glAttachShader(programHandle, vShader);
    glAttachShader(programHandle, fShader);
    
    glLinkProgram(programHandle);
    
    GLint linkSuccess;
    glGetProgramiv(programHandle, GL_LINK_STATUS, &linkSuccess);
    if (linkSuccess == GL_FALSE) {
        GLchar message[256];
        glGetProgramInfoLog(programHandle, sizeof(message), 0, &message[0]);
        NSString* messageString = [NSString stringWithUTF8String:message];
        NSLog(@"%@", messageString);
        exit(-1);
    }
    
    return programHandle;
}

- (GLuint)compileShader:(NSString*)fileName withType:(GLenum)shaderType
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSString* shaderString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    GLuint shaderHandle = glCreateShader(shaderType);
    const char* shaderContent = [shaderString UTF8String];
    glShaderSource(shaderHandle, 1, &shaderContent, 0);
    
    glCompileShader(shaderHandle);
    
    GLint compileSuccess;
    glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &compileSuccess);
    if (compileSuccess == GL_FALSE) {
        GLchar message[256];
        glGetShaderInfoLog(shaderHandle, sizeof(message), 0, &message[0]);
        NSString* messageString = [NSString stringWithUTF8String:message];
        NSLog(@"%@", messageString);
        exit(-1);
    }
    
    return shaderHandle;
}

@end
