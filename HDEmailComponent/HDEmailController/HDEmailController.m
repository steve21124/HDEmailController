//
//  HDEmailController.m
//  HDEmailComponent
//
//  Created by Joseph Gorecki on 12/2/13.
//  Copyright (c) 2013 Joseph Gorecki. All rights reserved.
//

#import "HDEmailController.h"
#import <MessageUI/MessageUI.h>

@interface HDEmailController ()<MFMailComposeViewControllerDelegate>

@end

@implementation HDEmailController

#pragma mark - Singleton
+(HDEmailController *)sharedEmailer{

    static HDEmailController *sharedEmailer = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedEmailer = [[[self class] alloc] init];
        
    });
    
    return sharedEmailer;

}

#pragma mark - Mail

-(void)sendEmail:(NSArray *)to withSubject:(NSString *)subject withMessage:(NSString *)message withAttachment:(NSString *)filePath withViewController:(UIViewController *)aViewController{
    
    if([MFMailComposeViewController canSendMail]){
    
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];

        mail.mailComposeDelegate = self;
        
        [mail setSubject:subject];
        
        NSMutableString *body = [[NSMutableString alloc] initWithString:message];
        
        [mail setMessageBody:body isHTML:YES];
        
        [mail setToRecipients:to];
        
        if (filePath) {
            if([[NSFileManager defaultManager]fileExistsAtPath:filePath isDirectory:NO]){
                NSData *noteData = [NSData dataWithContentsOfFile:filePath];
                [mail addAttachmentData:noteData mimeType:@"video/mp4"  fileName:@"video.mp4"];
            }
        }
        
        [aViewController presentViewController:mail animated:YES completion:nil];
        
    }else{
    
        [self showAlert:@"Unable to send email on this device." andTitle:@"Mail"];
    
    }
    
}

#pragma mark - Mail Callbacks
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
	   
    switch (result)
    {
        case MFMailComposeResultFailed:{
            [self showAlert:[error localizedDescription] andTitle:@"Mail"];
        }break;
        default:{
            //no-op
        }break;
            
    }
    
	[controller dismissViewControllerAnimated:YES completion:nil];
	
}

-(void)showAlert:(NSString *)aMessage andTitle:(NSString *)aTitle{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];

    [alert show];
    
}

@end
