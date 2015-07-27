//
//  BIDDoubleComponentPickerViewController.m
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import "BIDDoubleComponentPickerViewController.h"

@interface BIDDoubleComponentPickerViewController ()

@end

@implementation BIDDoubleComponentPickerViewController
@synthesize doublePicker;
@synthesize fillingTypes;
@synthesize breadTypes;

-(IBAction)buttonPressed
{
    // We need to specify which component we are talking
    // about when we request the selected row using those
    // constants we defined earlier, kBreadComponent and kFillingComponent.
    NSInteger fillingRow = [doublePicker selectedRowInComponent:
                            kFillingComponent];
    NSInteger breadRow = [doublePicker selectedRowInComponent:
                          kBreadComponent];
    
    NSString *bread = [breadTypes objectAtIndex:breadRow];
    NSString *filling = [fillingTypes objectAtIndex:fillingRow];
    
    NSString *message = [[NSString alloc] initWithFormat:
                         @"Your %@ on %@ bread will be right up.",
                         filling, bread];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:
                          @"Thank you for your order"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Great!"
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
#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *fillingArray = [[NSArray alloc] initWithObjects:@"Ham",
                             @"Turkey", @"Peanut Butter", @"Tuna Salad",
                             @"Chicken Salad", @"Roast Beef", @"Vegemite",
                             nil];
    self.fillingTypes = fillingArray;
    
    NSArray *breadArray = [[NSArray alloc] initWithObjects:@"White",
                           @"Whole Wheat", @"Rye", @"Sourdough",
                           @"Seven Grain",nil];
    self.breadTypes = breadArray;
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
    self.doublePicker = nil;
    self.breadTypes = nil;
    self.fillingTypes = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -
#pragma mark Picker Data Source Methods
// Specify that our picker should have two components
// rather than just one.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// when we are asked for the number of rows, we need
// to check which component the picker is asking about
// and return the correct row count for the corresponding array.
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    if (component == kBreadComponent)
        return [self.breadTypes count];
    
    return [self.fillingTypes count];
}

#pragma mark Picker Delegate Methods
// Check the component and use the correct array for the
// requested component to fetch and return the correct value.
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    if (component == kBreadComponent)
        return [self.breadTypes objectAtIndex:row];
    return [self.fillingTypes objectAtIndex:row];
}

@end
