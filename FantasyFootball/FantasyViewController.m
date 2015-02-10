//
//  FantasyViewController.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "FantasyViewController.h"

@interface FantasyViewController ()


@end

@implementation FantasyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// hide status bar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API Manager Delegate Methods
- (void)apiManager:(APIManager *)apiManager didReturnData:(id)data
{
    // OVERRIDE
}

- (void)apiManager:(APIManager *)apiManager didReturnError:(NSString *)errorMessage
{
    NSLog(@"API Return Error: %@", errorMessage);
}

@end
