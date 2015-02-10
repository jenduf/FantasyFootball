
//
//  Constants.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/19/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#ifndef FantasyFootball_Constants_h
#define FantasyFootball_Constants_h

#define API_KEY             @"xc348w3ys86i"
#define REST_API_URL        @"http://www.fantasyfootballnerd.com/service/"

// http protocols
#define HTTP_POST               @"POST"
#define HTTP_GET                @"GET"
#define HTTP_DELETE             @"DELETE"
#define HTTP_PATCH              @"PATCH"
#define HTTP_PUT                @"PUT"

#define HTTP_CODE_SUCCESS               200


#define DATE_FORMAT_STRING          @"yyyy-MM-dd"
#define WEEKDAY_FORMAT_STRING       @"EEEE, MMMM d"

// arrays
#define QB_HEADER_TEXT  @[@"ATT", @"COMP", @"YDS", @"TD", @"INT"]
#define RB_HEADER_TEXT  @[@"", @"ATT", @"YDS", @"TD", @"FUM"]
#define WR_HEADER_TEXT  @[@"", @"", @"REC", @"YDS", @"TD"]
#define K_HEADER_TEXT   @[@"", @"", @"FG", @"ATT", @"XP"]
#define DEF_HEADER_TEXT @[@"INT", @"FF", @"FR", @"SACK", @"PA"]

// identifiers
#define TEAM_CELL_IDENTIFIER        @"TeamCellIdentifier"
#define GAME_CELL_IDENTIFIER        @"GameCellIdentifier"
#define PLAYER_CELL_IDENTIFIER      @"PlayerCellIdentifier"
#define WEEKLY_CELL_IDENTIFIER      @"WeeklyCellIdentifier"
#define PROJECTION_CELL_IDENTIFIER  @"ProjectionCellIdentifier"


// strings
#define POSITION_QB         @"QB"
#define POSITION_RB         @"RB"
#define POSITION_WR         @"WR"
#define POSITION_TE         @"TE"
#define POSITION_K          @"K"
#define POSITION_DEF        @"DEF"

// layout
#define ARROW_HEIGHT        10


typedef int RequestType;
enum
{
    RequestTypeNone = 0,
    RequestTypeTeams = 1,
    RequestTypeSchedule = 2,
    RequestTypePlayers = 3,
    RequestTypeDraftRankings = 4,
    RequestTypeWeeklyRankings = 5,
    RequestTypeWeeklyProjections = 6
};

typedef int PositionType;
enum
{
    PositionTypeNone = 0,
    PositionTypeQB = 1,
    PositionTypeRB = 2,
    PositionTypeWR = 3,
    PositionTypeTE = 4,
    PositionTypeK = 5,
    PositionTypeDEF = 6
};

#endif
