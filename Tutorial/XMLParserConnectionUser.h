//
//  XMLParserConnectionUser.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "InformationsConnectionUser.h"

@interface XMLParserConnectionUser : NSObject <NSXMLParserDelegate>
{
   //current object
    NSMutableString * currentNodeContent;
    
    //XML information
    NSMutableArray * informationsRequestConnectionUser;
    
    //parser
    NSXMLParser * parser;
    
    //current information
    InformationsConnectionUser * currentInformation;
    
}

@property(readonly, retain)NSMutableArray * informationsRequestConnectionUser;


-(id) loadXMLtoURL:(NSString * ) urlString;

@end
