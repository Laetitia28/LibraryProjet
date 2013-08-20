//
//  XMLParser.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Informations.h"

@interface XMLParser : NSObject <NSXMLParserDelegate>{
    
    //current object
    NSMutableString * currentNodeContent;
    
    //XML information
    NSMutableArray * informations;
    
    //parser
    NSXMLParser * parser;
    
    //current information
    Informations * currentInformation;
}


@property(readonly, retain)NSMutableArray * informations;


-(id) loadXMLtoURL:(NSString * ) urlString;



@end
