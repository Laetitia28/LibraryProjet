//
//  AdvancedResearch.h
//  Tutorial
//
//  Created by Projet on 22/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AdvancedResearch : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UIView *pickerView2;
    NSMutableArray *arraySupport2;
    
    
}
- (IBAction)valid:(id)sender;


@property (strong, nonatomic)  IBOutlet UIView *pickerView2;
@property (strong, nonatomic) IBOutlet UILabel *label;



@property (weak,nonatomic) id delegate;


@end
