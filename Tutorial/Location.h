//
//  Location.h
//  Tutorial
//
//  Created by Projet on 15/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <MapKit/MapKit.h>



@interface Location : NSObject <MKAnnotation> {


    NSString * _name;
    NSString * _address;
    CLLocationCoordinate2D _coordinate ;



}

@property (copy)   NSString * name;
@property (copy)  NSString * address;
@property (nonatomic, readonly)  CLLocationCoordinate2D coordinate ;


-(id)initWithName:(NSString *)name  address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;




@end
