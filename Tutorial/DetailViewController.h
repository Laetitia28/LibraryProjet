//
//  DetailViewController.h
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InformationSchedule.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>
{
    
    IBOutlet UITextView *viewMonday;   
    IBOutlet UITextView *viewTuesday;    
    IBOutlet UITextView *viewWednesday;
    IBOutlet UITextView *viewFriday;
    IBOutlet UITextView *viewThursday;    
    IBOutlet UITextView *viewSaturday;    
    IBOutlet UITextView *viewCoordinate;
    
    
    
    
}


@property(nonatomic,retain)  IBOutlet UITextView *viewMonday;
@property(nonatomic,retain)  IBOutlet UITextView *viewTuesday;
@property(nonatomic,retain)  IBOutlet UITextView *viewWednesday;
@property(nonatomic,retain)  IBOutlet UITextView *viewThursday;
@property(nonatomic,retain)  IBOutlet UITextView *viewFriday;
@property(nonatomic,retain)  IBOutlet UITextView *viewSaturday;
@property(nonatomic,retain)  IBOutlet UITextView *viewCoordinate;

 
 
@property(nonatomic,retain) InformationSchedule * mtView;



@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;



@end
