//
//  WheelView.h
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/9/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WheelViewDataSource;
@class WheelViewCell;

typedef enum {
    WheelViewStyleWheel,
    WheelViewStyleCarousel
} WheelViewStyle;

@interface WheelView : UIView

@property (strong, nonatomic) IBOutlet id<WheelViewDataSource> dataSource;
@property (assign, nonatomic) WheelViewStyle style;

@end

@protocol WheelViewDataSource <NSObject>

@required
- (NSInteger)wheelViewNumberOfCells:(WheelView*)wheelView;
- (WheelViewCell*)wheelView:(WheelView*)wheelView cellAtIndex:(NSInteger)index;

@end

@interface WheelViewCell : UIView

@end