//
//  DetailViewController.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/8/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WheelView.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, WheelViewDataSource>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet WheelView* wheelView;

@end
