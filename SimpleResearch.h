//
//  SimpleResearch.h
//  Tutorial
//
//  Created by Projet on 20/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SimpleResearch : UIViewController  <UIPickerViewDataSource, UIPickerViewDelegate> {
    
     IBOutlet UIView *pickerView;
    
     NSMutableArray *arraySupport;


    }

@property (strong, nonatomic) IBOutlet UIView *pickerView;
@property (weak,nonatomic)id delegate;


- (IBAction)valid:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *labelSupport;




@end
