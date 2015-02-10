//
//  DraftRankingViewController.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "DraftRankingViewController.h"

@interface DraftRankingViewController ()

@end

@implementation DraftRankingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[APIManager sharedManager] getDraftRankingsWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - API Manager Delegate Methods
- (void)apiManager:(APIManager *)apiManager didReturnData:(id)data
{
   // NSDictionary *dataDict = (NSDictionary *)data;
    
    switch (apiManager.requestType)
    {
        case RequestTypeDraftRankings:
        {
          /*  NSArray *playerArray = dataDict[@"Players"];
            
            for(NSDictionary *dict in playerArray)
            {
                Player *player = [[Player alloc] initWithDictionary:dict];
                [self.players addObject:player];
            }*/
        }
            break;
            
        default:
            break;
    }
}

@end
