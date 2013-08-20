//
//  XMLParserRequestLoans.m
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParserRequestLoans.h"
#import "InformationsRequestLoans.h"

@implementation XMLParserRequestLoans

@synthesize informationsRequestLoans;

-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informationsRequestLoans = [[NSMutableArray alloc] init];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSString * dataString = [ NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding   error:NULL];
    
    
    NSData * data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    parser          = [[NSXMLParser alloc] initWithData:data];
    
    parser.delegate = self;
    
    [parser parse];
    
    return self;
    
    
}


- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"ICOMM_ITEMS"])
    {
        NSLog(@"user element found – create a new instance of User class...");
        
        currentInformation = [[InformationsRequestLoans alloc] init];
    }
    
    
    if ([elementname isEqualToString:@"STATUS"]){
        
        currentInformation.statusLaon=[attributeDict valueForKey:@"display"];
        
    }
    
    if ([elementname isEqualToString:@"SITE"]){
        
        currentInformation.site=[attributeDict valueForKey:@"display"];
        
    }
    
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"CALL_NUMBER"])
    {
        currentInformation.codeBarre = currentNodeContent;
        
    }
    
    if ([elementname isEqualToString:@"ICOMM_ITEMS"])
    {
        
        [informationsRequestLoans addObject:currentInformation];
        
        currentInformation = nil;
        
        
        currentNodeContent = nil;
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}



@end
