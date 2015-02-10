//
//  ViewController.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/19/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "TeamViewController.h"
#import "Team.h"
#import "TeamCell.h"

@interface TeamViewController ()

@property (nonatomic, weak) IBOutlet UITableView *teamTableView;

@end

@implementation TeamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[APIManager sharedManager] getTeamsWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[TeamDataController sharedController] countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamCell *cell = [tableView dequeueReusableCellWithIdentifier:TEAM_CELL_IDENTIFIER];
    
    Team *team = [[TeamDataController sharedController] objectInListAtIndex:indexPath.row];
    
    [cell setTeam:team];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
}

#pragma mark - API Manager Delegate Methods
- (void)apiManager:(APIManager *)apiManager didReturnData:(id)data
{
    NSDictionary *dataDict = (NSDictionary *)data;
    
    switch (apiManager.requestType)
    {
        case RequestTypeTeams:
        {
            NSArray *teamArray = dataDict[@"NFLTeams"];
            
            NSMutableArray *teamList = [NSMutableArray array];
            
            for(NSDictionary *dict in teamArray)
            {
                Team *team = [[Team alloc] initWithDictionary:dict];
                [teamList addObject:team];
            }
            
            [[TeamDataController sharedController] setMasterTeamList:teamList];
            
            [self.teamTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}

@end
