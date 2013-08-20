//
//  InformationsConnectionUser.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationsConnectionUser : NSObject{
    
    NSString * catalogId;
    NSString * dueDate;

}

@property (nonatomic,retain) NSString * catalogId;
@property (nonatomic,retain) NSString * dueDate;

@end
