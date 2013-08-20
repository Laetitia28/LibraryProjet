//
//  Informations.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Informations : NSObject{
    
    NSString * apiSession;
    NSString * timeout;
    NSString * userId;
}

@property (nonatomic, retain) NSString *apiSession;
@property(nonatomic ,retain) NSString *timeout;
@property(nonatomic ,retain) NSString *userId;


@end
