//
//  PlanViewController.h
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <CoreLocation/CoreLocation.h>

#import"Location.h"

@interface PlanViewController : UIViewController


@property (weak, nonatomic) IBOutlet MKMapView *_mapView;

@end
