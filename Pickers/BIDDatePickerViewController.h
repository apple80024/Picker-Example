//
//  BIDDatePickerViewController.h
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDatePickerViewController : UIViewController

// The outlet will be used to grab the value from the date picker.
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

// The action will be triggered by a button and will put
// up an alert to show the date value pulled from the picker.
- (IBAction)buttonPressed;

@end
