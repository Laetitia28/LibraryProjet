//
//  InformationsRequest.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationsRequest : NSObject{
    
    NSString * type;
    NSString * title;
    NSString * author;
    NSString * editor;
    NSString * yearEdition;
    NSString * identifierBook;
    NSString * status;
    NSString * codeBarre;


}

@property(nonatomic ,retain) NSString * type;
@property(nonatomic ,retain) NSString * title;
@property(nonatomic ,retain) NSString * author;
@property(nonatomic ,retain) NSString * editor;
@property(nonatomic ,retain) NSString * yearEdition;
@property(nonatomic ,retain) NSString * identifierBook;
@property(nonatomic ,retain) NSString * status;
@property(nonatomic ,retain) NSString * codeBarre;

@end
