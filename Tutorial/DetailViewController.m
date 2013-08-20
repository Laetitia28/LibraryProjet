//
//  DetailViewController.m
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "DetailViewController.h"

#import "InformationSchedule.h"


#import "MasterViewController.h"


@interface DetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@end

@implementation DetailViewController

@synthesize mtView,viewMonday,viewTuesday,viewWednesday,viewThursday,viewFriday,viewSaturday,viewCoordinate;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        
        _detailItem = newDetailItem;
        
        mtView = (InformationSchedule*) _detailItem;
        
        self.title =mtView.title;
        
        // Update the view.
        [self configureView];
        
    }

    if (self.masterPopoverController != nil) {
        
        [self.masterPopoverController dismissPopoverAnimated:YES];
       
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        self.detailDescriptionLabel.text = [self.detailItem description];
       
        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Detail");
    
    
     
    viewMonday.text=mtView.monday;
    viewTuesday.text=mtView.tuesday;
    viewWednesday.text=mtView.wednesday;
    viewThursday.text=mtView.thursday;
    viewFriday.text=mtView.friday;
    viewSaturday.text=mtView.saturday;
    viewCoordinate.text=mtView.coordinate;
   
    
    viewMonday.editable=NO;
    viewTuesday.editable=NO;
    viewWednesday.editable=NO;
    viewThursday.editable=NO;
    viewFriday.editable=NO;
    viewSaturday.editable=NO;
    viewCoordinate.editable=NO;
    
    
    viewMonday.scrollEnabled =NO;
    viewTuesday.scrollEnabled=NO;
    viewWednesday.scrollEnabled=NO;
    viewThursday.scrollEnabled=NO;
    viewFriday.scrollEnabled=NO;
    viewSaturday.scrollEnabled=NO;
    viewCoordinate.scrollEnabled=NO;
    
    
 
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    
    self.masterPopoverController = popoverController;
    
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    
    self.masterPopoverController = nil;
    
}

@end
