//
//  InformationsCompteUsers.h
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationsCompteUsers : NSObject

{
    NSString * catalogSystemId;
    NSString * dueDate;
    
}


@property (nonatomic, retain) NSString *catalogSystemId;

@property(nonatomic ,retain) NSString *dueDate;
@end
