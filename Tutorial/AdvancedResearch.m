//
//  AdvancedResearch.m
//  Tutorial
//
//  Created by Projet on 22/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "AdvancedResearch.h"
#import "SearchAViewController.h"

@interface AdvancedResearch ()

@end

@implementation AdvancedResearch

@synthesize label,pickerView2;

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
    
    
    arraySupport2 = [[NSMutableArray alloc] init];
    [arraySupport2 addObject:@""];
    [arraySupport2 addObject:@"Documents papiers"];
    [arraySupport2 addObject:@"Thèses numériques"];
    [arraySupport2 addObject:@"Liens web"];
    [arraySupport2 addObject:@"Thèses/Mémoires"];
    [arraySupport2 addObject:@"Livres numériques"];
    [arraySupport2 addObject:@"Publications UHA"];
    
    
    
    pickerView2.frame=CGRectMake(0, 460, 320, 261);
	// Do any additional setup after loading the view.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [arraySupport2 count];
}
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [arraySupport2 objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    label.text=[arraySupport2 objectAtIndex:[thePickerView  selectedRowInComponent:0]];
    
    NSLog(@"Selected Support: %@. Index of selected support: %i", [arraySupport2 objectAtIndex:row], row);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)valid:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [(SearchAViewController *)self.delegate setLabelSupport:self.label.text];
}


@end
