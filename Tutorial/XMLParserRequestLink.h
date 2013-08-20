//
//  XMLParserRequestLink.h
//  Library
//
//  Created by Projet on 29/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InformationRequestLink.h"

@interface XMLParserRequestLink : NSObject<NSXMLParserDelegate>

{
    //current object
    NSMutableString * currentNodeContent;
    
    //XML information
    NSMutableArray * informationsRequestsLink;
    
    //parser
    NSXMLParser * parser;
    
    //current information
    InformationRequestLink * currentInformation;
}


@property(readonly, retain)NSMutableArray * informationsRequestsLink;


-(id) loadXMLtoURL:(NSString * ) urlString;

@end
