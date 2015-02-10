//
//  PlayerViewController.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "PlayerViewController.h"
#import "Player.h"
#import "PlayerCell.h"

@interface PlayerViewController ()

@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, weak) IBOutlet UITableView *playerTableView;

@end

@implementation PlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.players = [[NSMutableArray alloc] init];
    
    [[APIManager sharedManager] getPlayersForPositionType:PositionTypeNone withDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:PLAYER_CELL_IDENTIFIER];
    
    Player *player = self.players[indexPath.row];
    
    [cell setPlayer:player];
    
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
        case RequestTypePlayers:
        {
            NSArray *playerArray = dataDict[@"Players"];
             
            for(NSDictionary *dict in playerArray)
            {
                Player *player = [[Player alloc] initWithDictionary:dict];
                [self.players addObject:player];
            }
            
            [self.playerTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}

@end
