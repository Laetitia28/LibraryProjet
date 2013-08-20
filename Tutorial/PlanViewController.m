//
//  PlanViewController.m
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "PlanViewController.h"

#import "Location.h"

@interface PlanViewController ()

@end

@implementation PlanViewController


@synthesize _mapView;






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
    
    //zoom on user position
    [_mapView setUserTrackingMode:TRUE];
    
    //activate zoom
    _mapView.zoomEnabled = TRUE;
    
    
    //Call file cvs where informations are
    NSString * csvFilePath = [[NSBundle mainBundle] pathForResource:@"biblilocation" ofType:@"csv"];
    
    
    NSString * dataStr =[NSString stringWithContentsOfFile:csvFilePath encoding:NSUTF8StringEncoding error:nil];
    
    
    NSArray * allLineStrings = [dataStr componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    //cross lines file
    for (NSString * line in allLineStrings){
        
        NSLog(@"%@" , line);
        
        
        NSArray *info  = [line componentsSeparatedByString:@"#"];
        
        if([info count] > 1){
            
            NSString* latitude =[info objectAtIndex:1];
            
            NSLog(@"%@",latitude);
            
            NSString* longitude =[info objectAtIndex:2];
            
            
            NSString* description =[info objectAtIndex:3];
            
            NSString* address =[info objectAtIndex:4];
            
            CLLocationCoordinate2D coordinate;
            
            coordinate.latitude = latitude.doubleValue;
            
            coordinate.longitude = longitude.doubleValue;
            
            Location * annotation = [[Location alloc] initWithName:description address:address coordinate:coordinate];
            
            [_mapView addAnnotation:annotation];
            
            
        }
        
        
    }
    
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
