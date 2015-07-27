//
//  BIDCustomPickerViewController.h
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDCustomPickerViewController : UIViewController

<UIPickerViewDataSource, UIPickerViewDelegate>

// - We're declaring two outlets, one for a picker view
//   and one for a label.
// - The label will be used to tell users when they've
//   won, which happens when they get three of the
//   same symbol in a row.
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UILabel *winLabel;

// - Use 5 pointers to hold the image views containing
//   the images we want the picker to draw.
// - Even though we're using the same images in all five
//   columns, we need separate arrays for each one with
//   its own set of image views, because each view can
//   be drawn in only one place in the picker at a time.
@property (strong, nonatomic) NSArray *column1;
@property (strong, nonatomic) NSArray *column2;
@property (strong, nonatomic) NSArray *column3;
@property (strong, nonatomic) NSArray *column4;
@property (strong, nonatomic) NSArray *column5;
@property (strong, nonatomic) IBOutlet UIButton *button;
- (IBAction)spin;

@end
