//
//  XMLParserCompte.h
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "InformationsUser.h"

@interface XMLParserCompte : NSObject <NSXMLParserDelegate>{
    
    //current objet
    NSMutableString * currentNodeContent;
    
    //XML information
    NSMutableArray * informationsUser;
    
    //parser
    NSXMLParser * parser;
    
    //current information 
    InformationsUser * currentInformation;
}


@property(readonly, retain)NSMutableArray * informationsUser;


-(id) loadXMLtoURL:(NSString * ) urlString;




@end
