//
//  BIDSingleComponentPickerViewController.m
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import "BIDSingleComponentPickerViewController.h"

@interface BIDSingleComponentPickerViewController ()

@end

@implementation BIDSingleComponentPickerViewController
@synthesize singlePicker;
@synthesize pickerData;

- (IBAction)buttonPressed {
    // - Unlike the date picker, a regular picker can't tell
    //   us what data it holds, because it doesn't maintain the data.
    // - It hands off that job to the delegate and data source.
    // - Instead, we need to ask the picker which row is selected,
    //   and then grab the corresponding data from our pickerData array.
    // - We have only one component in this picker, so we simply
    //   pass in 0, which is the index of the first component.
    NSInteger row = [singlePicker selectedRowInComponent:0];
    NSString *selected = [pickerData objectAtIndex:row];
    NSString *title = [[NSString alloc] initWithFormat:
                       @"You selected %@!", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@"Thank you for choosing."
                                                   delegate:nil
                                          cancelButtonTitle:@"You're Welcome"
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
    NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia",
                      @"Han", @"Chewbacca", @"Artoo",
                      @"Threepio", @"Lando", nil];
    self.pickerData = array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.singlePicker = nil;
    
    // Setting pickerData to nil is appropriate here because
    // the pickerData array will be re-created each time
    // the view is reloaded
    self.pickerData = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// ========================================================
// - The #pragma directives are actually directives to the IDE, not
//   the compiler, and they tell Xcodes editor to put a
//   break in the popup menu of methods and functions at the
//   top of the editor pane.
//   + The first one puts the break in the menu.
//   + The second creates a text entry containing whatever
//     the rest of the line holds, which you can use as a sort
//     of descriptive header for groups of methods
//     in your source code.
#pragma mark -
#pragma mark Picker Data Source Methods

// Pickers can have more than one spinning wheel,
// or component, and this is how the picker asks
// how many components it should display.
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

// This method is used by the picker to ask how many
// rows of data there are for a given component.
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [pickerData count];
}

// ========================================================
#pragma mark Picker Delegate Methods
// - In this method, the picker is asking us to provide
//   the data for a specific row in a specific component.
// - We are provided with a pointer to the picker that is
//   asking, along with the component and row that it is
//   asking about.
// - Since our view has one picker with one component,
//   we simply ignore everything except the row argument
//   and use that to return the appropriate item from
//   our data array.
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [pickerData objectAtIndex:row];
}

@end
