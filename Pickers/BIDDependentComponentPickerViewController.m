//
//  BIDDependentComponentPickerViewController.m
//  Pickers
//
//  Created by Brian Chen on 2014/7/18.
//  Copyright (c) 2014年 Brian Chen. All rights reserved.
//

#import "BIDDependentComponentPickerViewController.h"

@interface BIDDependentComponentPickerViewController ()

@end

@implementation BIDDependentComponentPickerViewController
@synthesize picker;
@synthesize stateZips;
@synthesize states;
@synthesize zips;

- (IBAction) buttonPressed {
    NSInteger stateRow = [picker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [picker selectedRowInComponent:kZipComponent];
    
    NSString *state = [self.states objectAtIndex:stateRow];
    NSString *zip = [self.zips objectAtIndex:zipRow];
    
    NSString *title = [[NSString alloc] initWithFormat:
                       @"You selected zip code %@.", zip];
    NSString *message = [[NSString alloc] initWithFormat:
                         @"%@ is in %@", zip, state];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
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
    NSBundle *bundle = [NSBundle mainBundle];
    // Return a URL containing the location of the
    // statedictionary.plist file.
    NSURL *plistURL = [bundle URLForResource:@"statedictionary"
                               withExtension:@"plist"];
    
    // We can then use that URL to create an NSDictionary
    // object. Once we do that, the entire contents of
    // that property list will be loaded into the newly
    // created NSDictionary object, which we then assign to stateZips.
    NSDictionary *dictionary = [NSDictionary
                                dictionaryWithContentsOfURL:plistURL];
    self.stateZips = dictionary;
    
    // - The dictionary we just loaded uses the names of
    //   the states as the keys and contains an NSArray
    //   with all the ZIP codes for that state as the values.
    // - To populate the array for the left-hand component,
    //   we get the list of all keys from our dictionary and
    //   assign those to the states array.
    // - Before we assign it, though, we sort it alphabetically.
    NSArray *components = [self.stateZips allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:
                       @selector(compare:)];
    self.states = sorted;
    
    // - Unless we specifically set the selection to another value,
    //   pickers start with the first row (row 0) selected.
    // - In order to get the zips array that corresponds to the
    //   first row in the states array, we grab the object from
    //   the states array that.s at index 0.
    // - That will return the name of the state that will be
    //   selected at launch time.
    // - We then use that state name to grab the array of ZIP
    //   codes for that state, which we assign to the zips
    //   array that will be used to feed data to the right-hand component.
    NSString *selectedState = [self.states objectAtIndex:0];
    NSArray *array = [stateZips objectForKey:selectedState];
    self.zips = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.picker = nil;
    self.stateZips = nil;
    self.states = nil;
    self.zips = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//======================================================
#pragma mark -
#pragma mark Picker Data Source Methods
// Add the delegate and data source methods.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (component == kStateComponent)
        return [self.states count];
    return [self.zips count];
}

//======================================================
#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == kStateComponent)
        return [self.states objectAtIndex:row];
    return [self.zips objectAtIndex:row];
}

// - In this method, which is called any time the picker's
//   selection changes, we look at the component and see whether
//   the left-hand component changed.
// - If it did, we grab the array that corresponds to the new
//   selection and assign it to the zips array. Then we set the
//   right-hand component back to the first row and tell it
//   to reload itself.
// - By swapping the zips array whenever
//   the state changes, the rest of the code remains pretty much
//   the same as it was in the DoublePicker example.

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        NSString *selectedState = [self.states objectAtIndex:row];
        NSArray *array = [stateZips objectForKey:selectedState];
        self.zips = array;
        [picker selectRow:0 inComponent:kZipComponent animated:YES];
        [picker reloadComponent:kZipComponent];
    }
}

// In this method, we return a number that represents
// how many pixels wide each component should be,
// and the picker will do its best to accommodate this.
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    if (component == kZipComponent)
        return 90;
    return 200;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
