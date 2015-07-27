//
//  BIDDatePickerViewController.m
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import "BIDDatePickerViewController.h"

@interface BIDDatePickerViewController ()

@end

@implementation BIDDatePickerViewController

// Synthesize the accessor and mutator for
// our datePicker outlet
@synthesize datePicker;

// We use our datePicker outlet to get the current date
// value from the date picker, and then we construct a
// string based on that date and use it to show an alert sheet.
- (IBAction)buttonPressed {
    NSDate *selected = [datePicker date];
    // The following code was provided by the author.
    // The displayed date has time zone issue.
    //
    // NSString *message = [[NSString alloc] initWithFormat:
    //     @"The date and time you selected is: %@", selected];
    //
    // Kevin Yung Kao's improved code (3/18/2013)
    NSString *message = [[NSString alloc] initWithFormat:
                         @"The date and time you selected is: %@",
                         [selected descriptionWithLocale:[NSLocale currentLocale]]];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Date and Time Selected"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"Yes, I did."
                          otherButtonTitles:nil];
    [alert show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // - Create a new NSDate object.
    //   + An NSDate object created this
    //     way will hold the current date and time.
    NSDate *now = [NSDate date];
    
    // Set datePicker to that date, which ensures that every
    // time this view is loaded from the nib, the picker
    // will reset to the current date and time.
    [datePicker setDate:now animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.datePicker = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
