//
//  XMLParserRequestPublication.h
//  Library
//
//  Created by Projet on 30/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InformationsRequest.h"

@interface XMLParserRequestPublication : NSObject<NSXMLParserDelegate>

{
    //current object
    NSMutableString * currentNodeContent;
    
    //XML information
    NSMutableArray * informationsRequestsPublications;
    
    //parser
    NSXMLParser * parser;
    
    //current information
    InformationsRequest * currentInformation;
}


@property(readonly, retain)NSMutableArray * informationsRequestsPublications;


-(id) loadXMLtoURL:(NSString * ) urlString;


@end
