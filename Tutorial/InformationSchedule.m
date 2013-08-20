//
//  Metier.m
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "InformationSchedule.h"

@implementation InformationSchedule


@synthesize title, description,schedules,monday,tuesday,wednesday,thursday,friday,saturday,coordinate;

-(id)initWithDictionnary:(NSDictionary * )dict{
    
    
    self = [super init];
    
    if (self){
        
        self.title = [[NSString alloc] initWithString:([dict objectForKey:@"title"])];
        
        self.description = [[NSString alloc] initWithString:([dict objectForKey:@"description"])];
        
        self.schedules = [[NSString alloc] initWithString:([dict objectForKey:@"schedules"])];
        
        self.monday = [[NSString alloc] initWithString:([dict objectForKey:@"monday"])];
        self.tuesday = [[NSString alloc] initWithString:([dict objectForKey:@"tuesday"])];
        self.wednesday = [[NSString alloc] initWithString:([dict objectForKey:@"wednesday"])];
        self.thursday = [[NSString alloc] initWithString:([dict objectForKey:@"thursday"])];
        self.friday = [[NSString alloc] initWithString:([dict objectForKey:@"friday"])];
        self.saturday = [[NSString alloc] initWithString:([dict objectForKey:@"saturday"])];
        
        self.coordinate = [[NSString alloc] initWithString:([dict objectForKey:@"coordinate"])];
        
        
    }
    return self;
}

@end
