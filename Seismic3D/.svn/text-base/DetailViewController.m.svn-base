//
//  DetailViewController.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoWheelViewCell.h"
#import "SceneViewController.h"

@interface DetailViewController () {
    bool bFlipFromLeft;
}

@property (strong, nonatomic) SceneViewController* sceneViewController;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@property (strong, nonatomic) NSArray* data;

@end

@implementation DetailViewController
@synthesize data = _data;
@synthesize wheelView = _wheelView;
@synthesize sceneViewController = _sceneViewController;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // [self configureView];
    UIImage* defaultPhoto = [UIImage imageNamed:@"defaultPhoto.png"];
    
    CGRect cellFrame = CGRectMake(0, 0, 75, 75);
    NSInteger count = 10;
    NSMutableArray* newArray = [[NSMutableArray alloc] initWithCapacity:count];
    for (NSInteger index = 0; index < count; ++index) {
        PhotoWheelViewCell* cell = [[PhotoWheelViewCell alloc] initWithFrame:cellFrame];
        [cell setImage:defaultPhoto];
        
        UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellDoubleTapped:)];
        [doubleTap setNumberOfTapsRequired:2];
        [cell addGestureRecognizer:doubleTap];
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)];
        [tap requireGestureRecognizerToFail:doubleTap];
        [cell addGestureRecognizer:tap];
        
        [newArray addObject:cell];
    }
    
    [self setData:[newArray copy]];
    
    NSArray* segmentedItems = [NSArray arrayWithObjects:@"Wheel", @"Carousel", @"Scene", nil];
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedItems];
    [segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segmentedControl setSelectedSegmentIndex:0];
    [[self navigationItem] setTitleView:segmentedControl];
    
    self.sceneViewController = [[SceneViewController alloc] initWithNibName:@"SceneViewController" bundle:nil];
}

- (void)cellTapped:(UIGestureRecognizer*)recognizer
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)cellDoubleTapped:(UIGestureRecognizer*)recognizer
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)segmentedControlValueChanged:(id)sender
{
    NSInteger index = [sender selectedSegmentIndex];
    if (index == 2) {
        [self switchViews:self.wheelView Destination:self.sceneViewController.view];
        [self.sceneViewController didMoveToParentViewController:self];
    } else {
        if (self.wheelView.superview == nil) {
            [self switchViews:self.sceneViewController.view Destination:self.wheelView];
        }
        
        if (index == 0) {
            [[self wheelView] setStyle:WheelViewStyleWheel];
        } else {
            [[self wheelView] setStyle:WheelViewStyleCarousel];
        }
    }
}

- (void)switchViews:(UIView*)sourceView Destination:(UIView*)destinationView
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    UIViewAnimationTransition transition = bFlipFromLeft ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight;
    bFlipFromLeft = !bFlipFromLeft;
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    
    [self.view addSubview:destinationView];
    [sourceView removeFromSuperview];
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
#pragma mark - Split view

//- (BOOL) splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
//{
//    return YES;
//}

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Objects", @"Objects tree");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - WheelViewDataSource methods

- (NSInteger)wheelViewNumberOfCells:(WheelView *)wheelView
{
    NSInteger count = [[self data] count];
    return count;
}

- (WheelViewCell*)wheelView:(WheelView *)wheelView cellAtIndex:(NSInteger)index
{
    WheelViewCell* cell = [[self data] objectAtIndex:index];
    return cell;
}

@end
