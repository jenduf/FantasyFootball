//
//  WeeklyProjectionsViewController.m
//  FantasyFootball2
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "WeeklyProjectionsViewController.h"
#import "ProjectionCell.h"
#import "ProjectionsList.h"
#import "PlayerProjectionData.h"
#import "AlternatingHeaderView.h"

@interface WeeklyProjectionsViewController ()

@property (nonatomic, weak) IBOutlet UITableView *projectionsTableView;
@property (nonatomic, weak) IBOutlet AlternatingHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *projections;
@property (nonatomic, assign) PositionType currentPositionType;

- (IBAction)changePositionType:(id)sender;

@end

@implementation WeeklyProjectionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.projections = [[NSMutableArray alloc] init];
    
    [self setCurrentPositionType:PositionTypeQB];
}

- (IBAction)changePositionType:(id)sender
{
    UISegmentedControl *segControl = (UISegmentedControl *)sender;
    
    [self setCurrentPositionType:(PositionType)(segControl.selectedSegmentIndex + 1)];
}

- (void)setCurrentPositionType:(PositionType)currentPositionType
{
    _currentPositionType = currentPositionType;
    
    [self.headerView setPositionType:currentPositionType];
    
    [[APIManager sharedManager] getWeeklyProjectionsByPositionType:currentPositionType forWeekNumber:0 withDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.projections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectionCell *cell = [tableView dequeueReusableCellWithIdentifier:PROJECTION_CELL_IDENTIFIER];
    
    PlayerProjectionData *playerData = self.projections[indexPath.row];
    
    [cell setProjectionData:[playerData getDataArrayForPositionType:self.currentPositionType]];
    
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
        case RequestTypeWeeklyProjections:
        {
            [self.projections removeAllObjects];
            
            ProjectionsList *projectionsList = [[ProjectionsList alloc] initWithDictionary:dataDict];
            
            [self.projections addObjectsFromArray:projectionsList.projections];
            
            [self.projectionsTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}

@end
