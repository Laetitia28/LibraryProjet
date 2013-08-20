//
//  Location.m
//  Tutorial
//
//  Created by Projet on 15/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "Location.h"


@implementation Location

@synthesize name = _name;
@synthesize  address = _address;
@synthesize  coordinate = _coordinate;


-(id)initWithName:(NSString *)name  address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate{


    if(self = [super init]){
    
        _name = [name copy];
        _address = [address copy];
        _coordinate = coordinate;
        
    
    }
return self;



}


-(NSString * )title {

if([_name isKindOfClass:[NSNull class]])
    
    return @"Unknown Charge";
else
    
    return _name;
    
}


-(NSString * )subtitle{

    return _address;

}







@end
