//
//  XMLParserRequest.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InformationsRequest.h"

@interface XMLParserRequest : NSObject <NSXMLParserDelegate>

{
    //current object 
    NSMutableString * currentNodeContent;
    
    //XML information
    NSMutableArray * informationsRequests;
    
    //parser
    NSXMLParser * parser;
    
    //current information
    InformationsRequest * currentInformation;
}


@property(readonly, retain)NSMutableArray * informationsRequests;


-(id) loadXMLtoURL:(NSString * ) urlString;




@end
