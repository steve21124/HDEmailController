//
//  HDViewController.m
//  HDEmailComponent
//
//  Created by Joseph Gorecki on 12/2/13.
//  Copyright (c) 2013 Joseph Gorecki. All rights reserved.
//

#import "HDViewController.h"
#import "HDEmailController.h"

@interface HDViewController ()

-(IBAction)testEmailComponent:(id)sender;

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)testEmailComponent:(id)sender{

    [[HDEmailController sharedEmailer] sendEmail:@[@"joe.gorecki@gmail.com"] withSubject:@"test is a test" withMessage:@"Ipsum lorem decum!" withViewController:self];

}

@end
