//
//  SimpleResearch.m
//  Tutorial
//
//  Created by Projet on 20/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "SimpleResearch.h"
#import"SearchSViewController.h"

@interface SimpleResearch ()

@end

@implementation SimpleResearch
@synthesize pickerView,labelSupport;

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
    arraySupport = [[NSMutableArray alloc] init];
    [arraySupport addObject:@""];
    [arraySupport addObject:@"Documents papiers"];
    [arraySupport addObject:@"Thèses numériques"];
    [arraySupport addObject:@"Liens web"];
    [arraySupport addObject:@"Thèses/Mémoires"];
    [arraySupport addObject:@"Livres numériques"];
    [arraySupport addObject:@"Publications UHA"];
  
    
    
     pickerView.frame=CGRectMake(0, 460, 320, 261);
	// Do any additional setup after loading the view.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [arraySupport count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [arraySupport objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    labelSupport.text=[arraySupport objectAtIndex:[thePickerView  selectedRowInComponent:0]];
    
    NSLog(@"Selected Support: %@. Index of selected support: %i", [arraySupport objectAtIndex:row], row);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewWillDisappear:(BOOL)animated
{
    [(SearchSViewController *)self.delegate setLabelSupport:self.labelSupport.text];
}

- (IBAction)valid:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
