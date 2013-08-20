//
//  InformationsRequestLoans.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationsRequestLoans : NSObject{
    
    NSString * statusLaon;
    NSString * codeBarre;
    
}

@property (nonatomic ,retain) NSString * statusLaon;
@property (nonatomic ,retain) NSString * codeBarre;
@property (nonatomic ,retain) NSString * site;


@end
