//
//  BIDDoubleComponentPickerViewController.h
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kFillingComponent 0
#define kBreadComponent   1

@interface BIDDoubleComponentPickerViewController : UIViewController
// Declare an outlet for the picker.
@property (strong, nonatomic) IBOutlet UIPickerView *doublePicker;

// The two arrays to hold the data for our two picker components.
@property (strong, nonatomic) NSArray *fillingTypes;
@property (strong, nonatomic) NSArray *breadTypes;

-(IBAction)buttonPressed;
@end
