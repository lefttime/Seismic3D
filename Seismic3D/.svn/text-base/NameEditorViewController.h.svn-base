//
//  NameEditorViewController.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NameEditorViewControllerDelegate;

@interface NameEditorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField* nameTextField;
@property (strong, nonatomic) id<NameEditorViewControllerDelegate> delegate;

@property (strong, nonatomic) NSIndexPath* indexPath;
@property (copy, nonatomic) NSString* defaultNameText;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

- (id)initWithDefaultNib;

@end

@protocol NameEditorViewControllerDelegate <NSObject>

@optional
- (void)nameEditorViewControllerDidFinish:(NameEditorViewController*)controller;
- (void)nameEditorViewControllerDidCancel:(NameEditorViewController*)controller;

@end
