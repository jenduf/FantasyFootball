//
//  WeeklyRankingViewController.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "WeeklyRankingsViewController.h"
#import "PositionRankingsList.h"
#import "PlayerRankData.h"
#import "RankingCell.h"

@interface WeeklyRankingsViewController ()

@property (nonatomic, weak) IBOutlet UITableView *rankingsTableView;
@property (nonatomic, strong) NSMutableArray *rankings;
@property (nonatomic, assign) PositionType currentPositionType;

- (IBAction)changePositionType:(id)sender;

@end

@implementation WeeklyRankingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rankings = [[NSMutableArray alloc] init];
    
    [self setCurrentPositionType:PositionTypeQB];
}

- (IBAction)changePositionType:(id)sender
{
    UISegmentedControl *segControl = (UISegmentedControl *)sender;
    
    [self setCurrentPositionType:(PositionType)(segControl.selectedSegmentIndex + 1)];
}

- (IBAction)showPopup:(id)sender
{
    
}

- (void)setCurrentPositionType:(PositionType)currentPositionType
{
    _currentPositionType = currentPositionType;
    
    [[APIManager sharedManager] getWeeklyRankingsByPositionType:currentPositionType forWeekNumber:0 withDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rankings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankingCell *cell = [tableView dequeueReusableCellWithIdentifier:WEEKLY_CELL_IDENTIFIER];
    
    PlayerRankData *playerData = self.rankings[indexPath.row];
    
    playerData.rank = (indexPath.row + 1);
    
    [cell setPlayerRankData:playerData];
    
    [cell.injuryButton addTarget:self action:@selector(showPopup:) forControlEvents:UIControlEventTouchUpInside];
    
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
        case RequestTypeWeeklyRankings:
        {
            [self.rankings removeAllObjects];
            
            PositionRankingsList *rankingsList = [[PositionRankingsList alloc] initWithDictionary:dataDict];
            
            [self.rankings addObjectsFromArray:rankingsList.rankings];
            
            [self.rankingsTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}

@end
