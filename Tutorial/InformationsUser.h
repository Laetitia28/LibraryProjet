//
//  InformationsUser.h
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationsUser : NSObject{
    
    NSString * name;
    NSString * card;
    NSString * dateInscription;
    NSString * dateSuspension;
    NSString * library;
    NSString * dateBirth;
    NSString * email;
    NSString * firstName;
    
}

@property(nonatomic,retain)NSString * name;
@property(nonatomic,retain)NSString * card;
@property(nonatomic,retain)NSString * dateInscription;;
@property(nonatomic,retain)NSString * dateSuspension;
@property(nonatomic,retain)NSString * library;
@property(nonatomic,retain)NSString * dateBirth;
@property(nonatomic,retain)NSString * email;
@property(nonatomic,retain)NSString * firstName;

@end
