//
//  XMLParserCompteUser.h
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InformationsCompteUsers.h"

@interface XMLParserCompteUser : NSObject <NSXMLParserDelegate>{
    
    
    
    //current objet
    NSMutableString * currentNodeContent;
    
 //XML information
    NSMutableArray * informationsCompteUsers;
    
    //parser
    NSXMLParser * parser;
    
     //current information 
    InformationsCompteUsers * currentInformation;
    
}

@property(readonly, retain)NSMutableArray * informationsCompteUsers;


-(id) loadXMLtoURL:(NSString * ) urlString;


@end
