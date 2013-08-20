//
//  MyBooks.m
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "MyBooks.h"
#import "XMLParser.h"
#import "XMLParserCompteUser.h"
#import "InformationsCompteUsers.h"


@implementation MyBooks

@synthesize userIdReceive,apiSessionReturn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
 Connect to the Library Server and retrieve the apiSession
 */

-(NSString *)connectTo{



    xmlParser = [[XMLParser alloc] loadXMLtoURL:@"http://www.scd.uha.fr/*********/XAPI?&method=login&code=api_scd&password=api_scd"];


    for(int i = 0; i < [[xmlParser informations] count]; i++) {
        
        
        
        NSLog(@"Session: %@", [(Informations *)[[xmlParser informations] objectAtIndex:i] apiSession]);
        
    }

    self.apiSessionReturn = [(Informations *)[[xmlParser informations] objectAtIndex:0] apiSession];



    return self.apiSessionReturn;



}

- (void)viewDidLoad
{



    [self connectTo];


    //Books
    NSString * URLMyBooks = @"http://www.scd.uha.fr/*********/XAPI?&method=communication.getLoanList&borrowerId=";
    NSString * URLComplet = [NSString stringWithFormat:@"%@%@%@%@",URLMyBooks,userIdReceive,@"&apiSession=",apiSessionReturn];
    NSLog(@"%@",URLComplet);

    xmlParserCompteUser = [[XMLParserCompteUser alloc]loadXMLtoURL:URLComplet];



    for(int i = 0; i < [[xmlParserCompteUser informationsCompteUsers] count]; i++) {
    
    NSLog(@"Catalogue: %@",[(InformationsCompteUsers*)[[xmlParserCompteUser informationsCompteUsers] objectAtIndex:i]catalogSystemId]);
    
    
    NSLog(@"Date de retour: %@",[(InformationsCompteUsers*)[[xmlParserCompteUser informationsCompteUsers] objectAtIndex:i]dueDate]);
    
    
}



    [  super viewDidLoad];
// Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

// Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSLog(@"%lu",(unsigned long)[[xmlParserCompteUser informationsCompteUsers] count]);
    
    return  [[xmlParserCompteUser informationsCompteUsers] count];

    }



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];

    if(cell == nil){
        cell=[[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    NSUInteger row =[indexPath row];

    cell.textLabel.text = [(InformationsCompteUsers *)[[xmlParserCompteUser informationsCompteUsers] objectAtIndex:row] catalogSystemId];


    cell.detailTextLabel.text = [(InformationsCompteUsers *)[[xmlParserCompteUser informationsCompteUsers] objectAtIndex:row] dueDate];



    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

@end
