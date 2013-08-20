//
//  XMLParserRequestLoans.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "InformationsRequestLoans.h"

@interface XMLParserRequestLoans : NSObject <NSXMLParserDelegate>
{
      //current object
    NSMutableString * currentNodeContent;
    
    //XML information
    NSMutableArray * informationsRequestLoans;
    
    //parser
    NSXMLParser * parser;
    
  //current information
    InformationsRequestLoans * currentInformation;
    
}

@property(readonly, retain)NSMutableArray * informationsRequestLoans;


-(id) loadXMLtoURL:(NSString * ) urlString;


@end
