//
//  NameEditorViewController.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "NameEditorViewController.h"

@interface NameEditorViewController ()

@end

@implementation NameEditorViewController
@synthesize nameTextField = _nameTextField;
@synthesize delegate = _delegate;
@synthesize indexPath = _indexPath;
@synthesize defaultNameText = _defaultNameText;

- (id)initWithDefaultNib;
{
    self = [super initWithNibName:@"NameEditorViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self isEditing]) {
        [[self nameTextField] setText:self.defaultNameText];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

#pragma mark - Actions methods

- (IBAction)cancel:(id)sender
{
    id<NameEditorViewControllerDelegate> delegate = [self delegate];
    if (delegate && [delegate respondsToSelector:@selector(nameEditorViewControllerDidCancel:)]) {
        [delegate nameEditorViewControllerDidCancel:self];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender
{
    id<NameEditorViewControllerDelegate> delegate = [self delegate];
    if (delegate && [delegate respondsToSelector:@selector(nameEditorViewControllerDidFinish:)]) {
        [delegate nameEditorViewControllerDidFinish:self];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
