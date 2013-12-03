//
//  HDEmailController.h
//  HDEmailComponent
//
//  Created by Joseph Gorecki on 12/2/13.
//  Copyright (c) 2013 Joseph Gorecki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDEmailController : NSObject

+(HDEmailController *)sharedEmailer;

-(void)sendEmail:(NSArray *)to
     withSubject:(NSString *)subject
     withMessage:(NSString *)message withViewController:(UIViewController *)aViewController;

@end
