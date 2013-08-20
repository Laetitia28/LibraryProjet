//
//  MasterViewController.h
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{
    
    NSMutableArray * tableWeb;
  
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property(nonatomic,retain)NSMutableArray * tableWeb;




@end
