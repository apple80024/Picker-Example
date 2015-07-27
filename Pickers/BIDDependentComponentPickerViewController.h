//
//  BIDDependentComponentPickerViewController.h
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kStateComponent   0
#define kZipComponent     1

@interface BIDDependentComponentPickerViewController : UIViewController

<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
// The dictionary we just loaded uses the names of
// the states as the keys and contains an NSArray
// with all the ZIP codes for that state as the values.
@property (strong, nonatomic) NSDictionary *stateZips;
@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) NSArray *zips;

- (IBAction) buttonPressed;

@end
