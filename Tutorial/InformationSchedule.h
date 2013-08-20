//
//  Metier.h
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InformationSchedule : NSObject{


    NSString *title;
    NSString *description;
    NSString *schedules;
    NSString *monday;
    
    
    NSString *tuesday;
    NSString *wednesday;
    NSString *thursday;
    NSString *friday;
    NSString *saturday;
    NSString *coordinate;

    

}

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *description;
@property(nonatomic,retain) NSString *schedules;

@property(nonatomic,retain) NSString *monday;
@property(nonatomic,retain) NSString *tuesday;
@property(nonatomic,retain) NSString *wednesday;
@property(nonatomic,retain) NSString *thursday;
@property(nonatomic,retain) NSString *friday;
@property(nonatomic,retain) NSString *saturday;
@property(nonatomic,retain) NSString *coordinate;
 





-(id)initWithDictionnary:(NSDictionary * )dict;








@end
