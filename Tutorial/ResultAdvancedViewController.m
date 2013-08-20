//
//  ResultAdvancedViewController.m
//  Tutorial
//
//  Created by Projet on 23/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "ResultAdvancedViewController.h"

#import "ResultAdvancedDetailViewController.h"

#import "XMLParser.h"

#import "Informations.h"

#import "InformationsRequest.h"

#import "XMLParserRequest.h"


#import "XMLParserRequestLink.h"

@interface ResultAdvancedViewController ()

@end

@implementation ResultAdvancedViewController


@synthesize xmlParserRequest,xmlParser,informationReceive2,informationReceive1,indexAdvancedReceive1,indexAdvancedReceive2,sourceNameAdvancedReceive,operatorAdvanced;

@synthesize apiSessionReturn,sourceNameEnter,xmlParserRequestLink,xmlParserRequestPublication;

- (id)initWithStyle:(UITableViewStyle)style
{
    
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*
 Connect to the Library Server and retrieve the apiSession
 */


-(NSString * )connectTo{
    
    xmlParser = [[XMLParser alloc] loadXMLtoURL:@"http://www.scd.uha.fr/*********/XAPI?&method=login&code=api_scd&password=api_scd"];
    
    
    return self.apiSessionReturn = [(Informations *)[[xmlParser informations] objectAtIndex:0] apiSession];

}
    


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Affichage des informations recues de la classe SearchAViewController
    /*
    
    NSLog(@"INFO1:%@",self.informationReceive1);
    NSLog(@"INDEX1:%@",self.indexAdvancedReceive1);
    NSLog(@"%@",self.sourceNameAdvancedReceive);
    NSLog(@"%@",self.operatorAdvanced);
    NSLog(@"INFO2:%@",self.informationReceive2);
    NSLog(@"INDEX2:%@",self.indexAdvancedReceive2);
    
    */
    
    //Initialisation des variables par default
    self.sourceNameEnter = @"default";
    NSString *sourceNameBegin = @"&sourceName=";
    
    NSString *tableNameEnter = @"UNIMARC";
    NSString *tableNameBegin = @"&tableName=";
    
    NSString * indexEnter =  @"UNIMARC28";
    NSString * indexEnter2 = @"UNIMARC28";
   
    
    /*
     Treatment of Informations received
    */
    
    
    if ([self.sourceNameAdvancedReceive isEqual: @"Documents papiers"]){
        
        self.sourceNameEnter = @"default";
        NSLog(@"    papier %@",self.sourceNameEnter);
        tableNameEnter = @"UNIMARC";
        NSLog(@"PAPIER %@",tableNameEnter);
        
        if([self.indexAdvancedReceive1 isEqual: @"title"]){
            indexEnter = @"UNIMARC28";
            NSLog(@"%@",indexEnter);
            NSLog(@"titre1");
            
            
        }
        
        else if([self.indexAdvancedReceive1 isEqual: @"author"]){
            
            indexEnter = @"UNIMARC18";
        }
        else if([self.indexAdvancedReceive1 isEqual: @"subject"]){
            
            
            indexEnter = @"DLIV_BASIC";
        }

        
        
        if([self.indexAdvancedReceive2 isEqual: @"title"]){
            indexEnter2 = @"UNIMARC28";
            NSLog(@"%@",indexEnter2);
            NSLog(@"titre2");
            
            
        }
        else if([self.indexAdvancedReceive2 isEqual: @"author"]){
            NSLog(@"%@",indexEnter2);
            NSLog(@"author2");
            
            indexEnter2 = @"UNIMARC18";
            NSLog(@"%@",indexEnter2);
        }
        else if([self.indexAdvancedReceive2 isEqual: @"subject"]){
            
            
            indexEnter2= @"DLIV_BASIC";
        }
        
    }
    
    else if ([self.sourceNameAdvancedReceive isEqual: @"Thèses numériques"]){
        
        sourceNameEnter = @"defaultfortmelectro";
        NSLog(@"ELECTRO:%@",sourceNameEnter);
        tableNameEnter = @"TM_ELECTRO";
        NSLog(@"%@",tableNameEnter);
        
        if([self.indexAdvancedReceive1 isEqual: @"title"]){
            indexEnter = @"TITLE";
            NSLog(@"title electro:%@",indexEnter);
            
            
        }
        else if([self.indexAdvancedReceive1 isEqual: @"author"]){
            
            
            indexEnter = @"CREATORS";
        }
         else if([self.indexAdvancedReceive1 isEqual: @"subject"]){
    
    
            indexEnter = @"DTM_ELECTRO_BASIC";
    }

    
        if([self.indexAdvancedReceive2 isEqual: @"title"]){
            indexEnter2 = @"TITLE";
            NSLog(@"%@",indexEnter);
            
            
        }
        else if([self.indexAdvancedReceive2 isEqual: @"author"]){
            
            
            indexEnter2 = @"CREATORS";
            NSLog(@"author electro:%@",indexEnter2);
           
        }
        else if([self.indexAdvancedReceive2 isEqual: @"subject"]){
    
    
            indexEnter2 = @"DTM_ELECTRO_BASIC";
    }

    
    
    }
    
   else if ([self.sourceNameAdvancedReceive isEqual: @"Liens web"]){
        
        self.sourceNameEnter = @"defaultforsignet";
        NSLog(@"%@",self.sourceNameEnter);
        tableNameEnter = @"SIGNET";
        NSLog(@"%@",tableNameEnter);
        
        if([self.indexAdvancedReceive1 isEqual: @"title"]){
            indexEnter = @"TITRE";
            NSLog(@"%@",indexEnter);
            
        }
        else if([self.indexAdvancedReceive1 isEqual: @"author"]){
            
            
            indexEnter = @"DSIGNET_MOTS";
            NSLog(@"author electro:%@",indexEnter2);
            
        }

        else if([self.indexAdvancedReceive1 isEqual: @"subject"]){
            
            
            indexEnter = @"DSIGNET_MOTS";
        }

        if([self.indexAdvancedReceive2 isEqual: @"title"]){
            indexEnter2 = @"TITRE";
            NSLog(@"%@",indexEnter);
            
        }
        else if([self.indexAdvancedReceive2 isEqual: @"subject"]){
            
            
            indexEnter2 = @"DSIGNET_MOTS";
        }
        else if([self.indexAdvancedReceive2 isEqual: @"author"]){
            
            
            indexEnter2 = @"DSIGNET_MOTS";
            NSLog(@"author electro:%@",indexEnter2);
            
        }


       
        
    }
    else if ([self.sourceNameAdvancedReceive isEqual: @"Thèses/Mémoires"]){
        
        sourceNameEnter = @"defaultformemoirepapier";
        NSLog(@"%@",sourceNameEnter);
        tableNameEnter = @"MEMOIRE_PAPIER";
        NSLog(@"%@",tableNameEnter);
        
        if([self.indexAdvancedReceive1 isEqual: @"title"]){
            indexEnter = @"TITLE";
            NSLog(@"Theses/Memoires%@",indexEnter);
            
            
        }
        else if([self.indexAdvancedReceive1 isEqual: @"author"]){
            
            
            indexEnter = @"CREATORS";
        }
        else if([self.indexAdvancedReceive1 isEqual: @"subject"]){
            
            
            indexEnter = @"DMEM_PAPIER_BASIC";
        }
        
        if([self.indexAdvancedReceive2 isEqual: @"title"]){
            indexEnter2 = @"TITLE";
            NSLog(@"Theses/Memoires%@",indexEnter2);
            
            
        }
        else if([self.indexAdvancedReceive2 isEqual: @"author"]){
        
            indexEnter2 = @"CREATORS";
            NSLog(@"Theses/Memoires%@",indexEnter2);
        }
        else if([self.indexAdvancedReceive2 isEqual: @"subject"]){
            
            
            indexEnter2 = @"DMEM_PAPIER_BASIC";
        }

        
    }

    else if ([self.sourceNameAdvancedReceive isEqual: @"Livres numériques"]){
        
        sourceNameEnter = @"defaultforlivel";
        NSLog(@"%@",sourceNameEnter);
        tableNameEnter = @"LIVRE_ELECTRO";
        NSLog(@"%@",tableNameEnter);
        
        if([self.indexAdvancedReceive1 isEqual: @"title"]){
            indexEnter = @"TITRE";
            NSLog(@"%@",indexEnter);
            
        }
        else if([self.indexAdvancedReceive1 isEqual: @"author"]){
            
            
            indexEnter = @"AUTEUR";
        }
        else if([self.indexAdvancedReceive1 isEqual: @"subject"]){
            
            
            indexEnter = @"DLIVRE_ELE_BASIC";
        }

        if([self.indexAdvancedReceive2 isEqual: @"title"]){
            indexEnter2 = @"TITRE";
            NSLog(@"%@",indexEnter);
            
        }
        else if([self.indexAdvancedReceive2 isEqual: @"author"]){
            
            
            indexEnter2 = @"AUTEUR";
        }
        else if([self.indexAdvancedReceive2 isEqual: @"subject"]){
            
            
            indexEnter2 = @"DLIVRE_ELE_BASIC";
        }

        
    }
    
    else if([self.sourceNameAdvancedReceive isEqual: @"Publications UHA"])
    {
        
        sourceNameEnter = @"publi_uha";
        NSLog(@"%@",sourceNameEnter);
        tableNameEnter = @"PUBLICATION";
        NSLog(@"%@",tableNameEnter);
        
        
        if([self.indexAdvancedReceive1 isEqual: @"title"]){
            indexEnter = @"FIELD1";
            NSLog(@"%@",indexEnter);
            
        }
        else if([self.indexAdvancedReceive1 isEqual: @"author"]){
            
            
            indexEnter = @"FIELD2";
        }
        else if([self.indexAdvancedReceive1 isEqual: @"subject"]){
            
            
            indexEnter = @"PUBLICATION_ALL";
        }
        if([self.indexAdvancedReceive2 isEqual: @"title"]){
            indexEnter2 = @"FIELD1";
            NSLog(@"%@",indexEnter);
            
        }
        else if([self.indexAdvancedReceive2 isEqual: @"author"]){
            
            
            indexEnter2 = @"FIELD2";
        }
        else if([self.indexAdvancedReceive2 isEqual: @"subject"]){
            
            
            indexEnter2 = @"PUBLICATION_ALL";
        }
        
    }
    
    
    /*Launch Requests according to the choosen Source  */
    apiSessionReturn = [self connectTo];
    NSString *sourceNameTotal = [NSString stringWithFormat:@"%@%@", sourceNameBegin, self.sourceNameEnter];
    
    
    
    NSString *tableNameTotal = [NSString stringWithFormat:@"%@%@", tableNameBegin, tableNameEnter];
    
    
    NSString * beginURL = @"http://www.scd.uha.fr/*********/XAPI?&method=publicaccess.query";

    NSString * bodyURLIndex =  @"&query=%5B";
    NSString * bodyURLLike =  @"%7Clike%7C";
    NSString * bodyURLOperator=@"%5D%5B";
    NSString * bodyURLIndex2=@"%7C";
    NSString * bodyURLLike2 =  @"%7Clike%7C";
    NSString * bodyURLApiSession =  @"%5D&apiSession=";


//  Encoding of informationReceive1 and informationReceive2

    NSString *originalString = [NSString stringWithCString:[informationReceive1 UTF8String] encoding:NSUTF8StringEncoding];
    CFStringRef encodedString = CFURLCreateStringByAddingPercentEscapes(
                                                                        kCFAllocatorDefault,
                                                                        (__bridge CFStringRef)(originalString),
                                                                        NULL,
                                                                        CFSTR(":/?#[]@!$&'()*+,;="),
                                                                        kCFStringEncodingUTF8);
    informationReceive1 = (__bridge NSString *)(encodedString);




    NSString *originalString2 = [NSString stringWithCString:[informationReceive2 UTF8String] encoding:NSUTF8StringEncoding];
    CFStringRef encodedString2 = CFURLCreateStringByAddingPercentEscapes(
                                                                        kCFAllocatorDefault,
                                                                        (__bridge CFStringRef)(originalString2),
                                                                        NULL,
                                                                        CFSTR(":/?#[]@!$&'()*+,;="),
                                                                        kCFStringEncodingUTF8);
    informationReceive2 = (__bridge NSString *)(encodedString2);



    NSString * bodyURLQueryConcaten;
    
    /*
     Construction of Url according the index
     */
      if ([indexAdvancedReceive1 isEqual: @"subject"]) {
    
        bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@", bodyURLIndex ,indexEnter , bodyURLLike,informationReceive1];
          
          if([indexAdvancedReceive2 isEqual: @"subject"]){
              
              if([sourceNameEnter isEqual:@"default"]){
              
              bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,informationReceive2,@"%5D%5BNOT%7CUNIMARC8%7Clike%7C22",bodyURLApiSession,apiSessionReturn];
                  NSLog(@"1");
              }
              else
              {
                   bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,informationReceive2,bodyURLApiSession,apiSessionReturn];
                  NSLog(@"2");
              }
          }
          else{
              if([sourceNameEnter isEqual:@"default"])
              {
                  bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,@"%25",informationReceive2,@"%25",@"%5D%5BNOT%7CUNIMARC8%7Clike%7C22",bodyURLApiSession,apiSessionReturn];
                  NSLog(@"3");
              }
              else
              {
              bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,@"%25",informationReceive2,@"%25",bodyURLApiSession,apiSessionReturn];
                  NSLog(@"4");
              }
          }
              
    
    
    }
    else
    {
        
        bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@", bodyURLIndex ,indexEnter , bodyURLLike,@"%25",informationReceive1,@"%25"];
        
        if([indexAdvancedReceive2 isEqual: @"subject"]){
            if([sourceNameEnter isEqual:@"default"]){
            
                bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,informationReceive2,@"%5D%5BNOT%7CUNIMARC8%7Clike%7C22",bodyURLApiSession,apiSessionReturn];
            }
            else
            {
            bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,informationReceive2,bodyURLApiSession,apiSessionReturn];
            }
        }
        else
        {
            if([sourceNameEnter isEqual:@"default"])
            {
                bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,@"%25",informationReceive2,@"%25",@"%5D%5BNOT%7CUNIMARC8%7Clike%7C22",bodyURLApiSession,apiSessionReturn];
            }
            else{
            
            bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@",bodyURLQueryConcaten,bodyURLOperator,operatorAdvanced,bodyURLIndex2,indexEnter2,bodyURLLike2,@"%25",informationReceive2,@"%25",bodyURLApiSession,apiSessionReturn];
            }
        }

        
    }

    
    NSString *totalUrl = [NSString stringWithFormat:@"%@%@%@%@", beginURL, sourceNameTotal,tableNameTotal,bodyURLQueryConcaten];
    
    
    
    NSLog(@"%@",totalUrl);
    
    /*
     Launch of the different request according to the source 
     
     */
    
    if([sourceNameEnter isEqual: @"defaultforsignet"]){
        
        
        
        xmlParserRequestLink = [[XMLParserRequestLink alloc] loadXMLtoURL:totalUrl];
        
        /* Alert View */ 
        if(([[self.xmlParserRequestLink informationsRequestsLink] count]==0)){
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:@"Not Found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }else{
            NSString * resultFound=[NSString stringWithFormat:@"Found: %d",[[xmlParserRequestLink informationsRequestsLink] count]];
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:resultFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }

        
        /*
        for(int i = 0; i < [[xmlParserRequestLink informationsRequestsLink] count]; i++) {
            
            NSLog(@"Type: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] type]);
            
            NSLog(@"Title: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] title]);
            NSLog(@"Author: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] author]);
            NSLog(@"Editor: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] editor]);
            
        }*/
        
    }
    else if([sourceNameEnter isEqual: @"publi_uha"]){
        
        NSLog(@"defaulforpublication %@", sourceNameEnter);
        
        xmlParserRequestPublication = [[XMLParserRequestPublication alloc] loadXMLtoURL:totalUrl];
        
        /* Alert View */ 
        if(([[self.xmlParserRequestPublication informationsRequestsPublications] count] ==0)){
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:@"Not Found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }else{
            NSString * resultFound=[NSString stringWithFormat:@"Found: %d",[[xmlParserRequestPublication informationsRequestsPublications] count]];
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:resultFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }

        
        /*
        for(int i = 0; i < [[xmlParserRequestPublication informationsRequestsPublications] count]; i++) {
            
            NSLog(@"Type: %@", [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i] type]);
            
            NSLog(@"Title: %@",[(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i] title]);
            NSLog(@"Author: %@", [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i]  author]);
            NSLog(@"YearEditor: %@", [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i]  yearEdition]);
            
        }*/
        
    }
    else{
        xmlParserRequest = [[XMLParserRequest alloc] loadXMLtoURL:totalUrl];
        
        /* Alert View */ 
        if(([[self.xmlParserRequest informationsRequests] count] ==0)){
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:@"Not Found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }else{
            NSString * resultFound=[NSString stringWithFormat:@"Found: %d",[[xmlParserRequest informationsRequests] count]];
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:resultFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }

        /*
        for(int i = 0; i < [[xmlParserRequest informationsRequests] count]; i++) {
            
            NSLog(@"Type: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] type]);
            
            NSLog(@"Title: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] title]);
            NSLog(@"Author: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] author]);
            NSLog(@"Editor: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] editor]);
            NSLog(@"YearEdition: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] yearEdition]);
            NSLog(@"IdentiferBook: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] identifierBook]);
            
            
        }
         */
    }
    
     [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}







#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView * )tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if([sourceNameEnter isEqual: @"defaultforsignet"]){
        NSLog(@"%lu",(unsigned long)[[self.xmlParserRequestLink informationsRequestsLink] count]);
        return  [[self.xmlParserRequestLink informationsRequestsLink] count];
        
    }
    if([sourceNameEnter isEqual: @"publi_uha"]){
        return  [[self.xmlParserRequestPublication informationsRequestsPublications] count];
        NSLog(@"%lu",(unsigned long)[[self.xmlParserRequestPublication informationsRequestsPublications] count]);
    }
    else
    {
        return  [[self.xmlParserRequest informationsRequests] count];
        NSLog(@"%lu",(unsigned long)[[self.xmlParserRequest informationsRequests] count]);
    }
    
    
    
    
    
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    if(cell == nil){
        cell=[[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row =[indexPath row];
    
    if([sourceNameEnter isEqual: @"defaultforsignet"]){
        
        NSLog(@"defaultforsignet table %@", sourceNameEnter);
        cell.textLabel.text = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:row] title];
        
        cell.detailTextLabel.text = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:row] type];
    }
    else if([sourceNameEnter isEqual: @"publi_uha"]){
        
        NSLog(@"defaultforsignet table %@", sourceNameEnter);
        cell.textLabel.text = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:row] title];
        
        cell.detailTextLabel.text = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications]objectAtIndex:row] author];
    }
    else
    {
        cell.textLabel.text = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:row] title];
        cell.detailTextLabel.text = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:row] author];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

   
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*
 Transition of title, type, editor, author according to the differents sources
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareforsegue");
    
    id destination = segue.destinationViewController;
    
    if ([destination isKindOfClass:[ResultAdvancedDetailViewController class]]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        if([sourceNameEnter isEqual: @"defaultforsignet"]){
            
            ((ResultAdvancedDetailViewController * )destination).labelTitleReceiveAdvanced = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:indexPath.row] title];
            ((ResultAdvancedDetailViewController * )destination).labelAuthorReceiveAdvanced= [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink]  objectAtIndex:indexPath.row ] author];
            ((ResultAdvancedDetailViewController * )destination).labelTypeReceiveAdvanced = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink]  objectAtIndex:indexPath.row ] type];
            ((ResultAdvancedDetailViewController * )destination).labelEditorReceiveAdvanced = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink]  objectAtIndex:indexPath.row ]editor];
        }
        
        else if([sourceNameEnter isEqual: @"publi_uha"]){
            
            ((ResultAdvancedDetailViewController * )destination).labelTitleReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:indexPath.row] title];
            
            ((ResultAdvancedDetailViewController * )destination).labelAuthorReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:indexPath.row ] author];
            
            ((ResultAdvancedDetailViewController * )destination).labelTypeReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications]  objectAtIndex:indexPath.row ] type];
            
            ((ResultAdvancedDetailViewController * )destination).labelYearReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:indexPath.row ]yearEdition];
            
        }
        else
        {
            
            
            
            ((ResultAdvancedDetailViewController * )destination).labelTitleReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row] title];
            ((ResultAdvancedDetailViewController * )destination).labelAuthorReceiveAdvanced= [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ] author];
            ((ResultAdvancedDetailViewController * )destination).labelTypeReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ] type];
            ((ResultAdvancedDetailViewController * )destination).labelEditorReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ]editor];
            ((ResultAdvancedDetailViewController * )destination).labelYearReceiveAdvanced = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ]yearEdition];
            
            ((ResultAdvancedDetailViewController * )destination).identiferBookReceive = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ] identifierBook  ];
        }
        
        ((ResultAdvancedDetailViewController * )destination).apiSessionReceive = self.apiSessionReturn;
        
    }
    
}



















/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     ￼ *detailViewController = [[￼ alloc] initWithNibName:@"￼" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
