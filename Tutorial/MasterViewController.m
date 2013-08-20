//
//  MasterViewController.m
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "InformationSchedule.h"



@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize tableWeb;

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary * root = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    NSArray * arrayFrenDict =[root objectForKey:@"Root"];
    
    //enumaration of arryFrenDict
    NSEnumerator * enume =[arrayFrenDict objectEnumerator];
    
    NSDictionary * object ;
    
    tableWeb= [[NSMutableArray alloc] init ];
    
    while (object = [enume nextObject]) {
        
        InformationSchedule *mt =[[InformationSchedule alloc ]initWithDictionnary:object];
        
        [tableWeb addObject:mt];
        
    }
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    [_objects insertObject:[NSDate date] atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableWeb count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier= @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    
    if(cell == nil){
        cell=[[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    InformationSchedule *mt =[tableWeb objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText:[mt title]];
    
    [[cell detailTextLabel] setText:[mt description]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_objects removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [[segue destinationViewController] setDetailItem:[self.tableWeb objectAtIndex:indexPath.row]];
    }
}

@end
