//
//  ScheduleViewController.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "ScheduleViewController.h"
#import "Schedule.h"
#import "GameCell.h"

@interface ScheduleViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Schedule *schedule;
@property (nonatomic, strong) NSDictionary *weeklyScheduleDictionary;
@property (nonatomic, weak) IBOutlet UITableView *scheduleTableView;

@end

@implementation ScheduleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[APIManager sharedManager] getScheduleWithDelegate:self];
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


#pragma mark - UITableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.weeklyScheduleDictionary.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *currentKey = self.weeklyScheduleDictionary.allKeys[section];
    NSArray *sectionArray = self.weeklyScheduleDictionary[currentKey];
    
    return sectionArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *currentKey = self.weeklyScheduleDictionary.allKeys[section];
    return currentKey;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameCell *cell = [tableView dequeueReusableCellWithIdentifier:GAME_CELL_IDENTIFIER];
    
    NSString *currentKey = self.weeklyScheduleDictionary.allKeys[indexPath.section];
    NSArray *sectionArray = self.weeklyScheduleDictionary[currentKey];
    
    Game *game = sectionArray[indexPath.row];
    
    [cell setGame:game];
    
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
        case RequestTypeSchedule:
        {
            self.schedule = [[Schedule alloc] initWithDictionary:dataDict];
            
            self.weeklyScheduleDictionary = [[NSDictionary alloc] initWithDictionary:[self.schedule sortCurrentWeekGamesByDay]];
            
            [self.scheduleTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}

@end
