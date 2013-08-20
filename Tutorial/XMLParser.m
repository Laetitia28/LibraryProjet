//
//  XMLParser.m
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParser.h"
#import "Informations.h"

@implementation XMLParser

@synthesize informations;


-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informations = [[NSMutableArray alloc] init];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSLog(@"url parser%@",url);

    NSString * dataString = [ NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding   error:NULL];
    
    NSLog(@" data String %@",dataString);
    
    NSData * data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    parser          = [[NSXMLParser alloc] initWithData:data];
    
    parser.delegate = self;
    
    [parser parse];
    
    return self;
    
    
}


- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"response"])
    {
        NSLog(@"user element found – create a new instance of User class...");
        
        currentInformation = [Informations alloc];
    }
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    
    if([elementname isEqualToString:@"borrowerId"]){
        
        currentInformation.userId = currentNodeContent;
        
    
    }
    
    if ([elementname isEqualToString:@"apiSession"])
    {
        currentInformation.apiSession = currentNodeContent;
        
    }
    
    if ([elementname isEqualToString:@"timeout"])
    {
        currentInformation.timeout = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"response"])
    {
        [informations addObject:currentInformation];
        
        currentInformation = nil;
        
        currentNodeContent = nil;
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}



@end
