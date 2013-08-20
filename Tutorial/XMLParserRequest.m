//
//  XMLParserRequest.m
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParserRequest.h"
#import "InformationsRequest.h"

@implementation XMLParserRequest
@synthesize informationsRequests;

NSInteger count = 0 ;
NSInteger number =0;



-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informationsRequests = [[NSMutableArray alloc] init];
    
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
        
        if(number == 0){
            number = [currentNodeContent intValue];
        }
        
        currentInformation = [[InformationsRequest alloc] init];
        
        currentInformation.identifierBook=[attributeDict valueForKey:@"recordId"];
        
    }
    
    if ([elementname isEqualToString:@"ICOMM_ITEMS"])
    {
        NSLog(@"user element found – create a new instance of User class...");
        
        currentInformation = [[InformationsRequest alloc] init];
    }
    
    
    if ([elementname isEqualToString:@"STATUS"]){
        
        currentInformation.status=[attributeDict valueForKey:@"display"];
        
    }
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"info"])
    {
        if(count==0){
           
            
            currentInformation.type = currentNodeContent;
           
           
            count = count+1;
        }
        else if(count==1){
            
            currentInformation.title = currentNodeContent;
            
            
            count = count+1;
        }
        else if(count==2){
            
            currentInformation.author = currentNodeContent;
            
            count = count+1;
        }
        else if(count==3){
            
            currentInformation.editor = currentNodeContent;
            
            count = count + 1;
        }
        else if (count==4){
            currentInformation.yearEdition = currentNodeContent;
            count = 0;
            
        }
        
        
        
    }
    if ([elementname isEqualToString:@"CALL_NUMBER"])
    {
        currentInformation.codeBarre = currentNodeContent;
        
    }
    
    
    if ([elementname isEqualToString:@"digest"])
    {
        
        [informationsRequests addObject:currentInformation];
        
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
