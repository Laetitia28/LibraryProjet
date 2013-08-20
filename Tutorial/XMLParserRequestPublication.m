//
//  XMLParserRequestPublication.m
//  Library
//
//  Created by Projet on 30/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParserRequestPublication.h"
#import "InformationsRequest.h"

@implementation XMLParserRequestPublication

@synthesize informationsRequestsPublications;

NSInteger  countPublication =0;
NSInteger  numberPublication = 0;

-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informationsRequestsPublications = [[NSMutableArray alloc] init];
    
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
    if ([elementname isEqualToString:@"digest"])
    {
        NSLog(@"user element found – create a new instance of User class...");
        
        if(numberPublication == 0){
            
            numberPublication = [currentNodeContent intValue];
        }
        
        currentInformation = [[InformationsRequest alloc] init];
        
        currentInformation.identifierBook=[attributeDict valueForKey:@"recordId"];
    }
    
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"info"])
    {
        if(countPublication==0){
            
            
            currentInformation.type = currentNodeContent;
            
            
            countPublication = countPublication+1;
            
        }
        else if(countPublication==1){
            
            currentInformation.title = currentNodeContent;
            
            
            countPublication = countPublication+1;
            
        }
        else if(countPublication==2){
            
            currentInformation.author = currentNodeContent;
            
            countPublication = countPublication+1;
            
        }
        else if(countPublication==3){
            
            currentInformation.yearEdition = currentNodeContent;
            
            countPublication = 0;
            
        }
        
        
        
    }
    
    
    
    if ([elementname isEqualToString:@"digest"])
    {
        
        [informationsRequestsPublications addObject:currentInformation];
        
        currentInformation = nil;
        
    }
    currentNodeContent = nil;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    if(!currentNodeContent){
        currentNodeContent =[NSMutableString string];
 
        
    }
    
    [currentNodeContent appendString:string];
}




@end
