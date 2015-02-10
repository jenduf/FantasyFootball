//
//  APIManager.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/19/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "APIManager.h"

@interface APIManager ()
<NSURLSessionDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSHTTPURLResponse *response;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionTask *currentTask;

@end

@implementation APIManager

static APIManager *sharedManager = nil;

+ (APIManager *)sharedManager
{
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^
    {
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    
    if(self)
    {
        
    }
    
    return self;
}

#pragma mark - Create the Session
- (NSURLSession *)configureSession
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
 
    return session;
}

#pragma mark - Parse Helpers
- (id)parseJSONResponse:(NSData *)json
{
    if(!json)
    {
        return nil;
    }
    
    NSError *error = nil;
    
    id data = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:&error];
    
    if(error)
    {
        NSLog(@"JSON ERROR: %@", error);
        return nil;
    }
    
    return data;
}

- (NSData *)dictionaryToJSON:(NSDictionary *)dict
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    if(jsonData.length > 0 && error == nil)
    {
        NSLog(@"Successful serialization of dictionary %@", jsonData);
    }
    else if(jsonData.length == 0 && error == nil)
    {
        NSLog(@"No data was returned after serialization");
    }
    else if(error != nil)
    {
        NSLog(@"An error happened = %@", error);
    }
    
    return jsonData;
}

#pragma mark - Get Teams Request
- (void)getTeamsWithDelegate:(id)delegate
{
    self.delegate = delegate;
    
    self.requestType = RequestTypeTeams;
    
    NSString *requestURL = [NSString stringWithFormat:@"%@nfl-teams/json/%@", REST_API_URL, API_KEY];
    
    [self startRequest:requestURL method:HTTP_GET postData:nil];
}

#pragma mark - Get Schedule Request
- (void)getScheduleWithDelegate:(id)delegate
{
    self.delegate = delegate;
    
    self.requestType = RequestTypeSchedule;
    
    NSString *requestURL = [NSString stringWithFormat:@"%@schedule/json/%@", REST_API_URL, API_KEY];
    
    [self startRequest:requestURL method:HTTP_GET postData:nil];
}

#pragma mark - Get Players Request
- (void)getPlayersForPositionType:(PositionType)positionType withDelegate:(id)delegate
{
    self.delegate = delegate;
    
    self.requestType = RequestTypePlayers;
    
    NSString *requestURL = [NSString stringWithFormat:@"%@players/json/%@/%@", REST_API_URL, API_KEY, [Utils getStringFromPositionType:positionType]];
    
    [self startRequest:requestURL method:HTTP_GET postData:nil];
}

#pragma mark - Get Draft Rankings Request
- (void)getDraftRankingsWithDelegate:(id)delegate
{
    self.delegate = delegate;
    
    self.requestType = RequestTypeDraftRankings;
    
    NSString *requestURL = [NSString stringWithFormat:@"%@draft-rankings/json/%@/", REST_API_URL, API_KEY];
    
    [self startRequest:requestURL method:HTTP_GET postData:nil];
}


#pragma mark - Get Weekly Rankings Request
- (void)getWeeklyRankingsByPositionType:(PositionType)positionType forWeekNumber:(NSInteger)weekNumber withDelegate:(id)delegate
{
    self.delegate = delegate;
    
    self.requestType = RequestTypeWeeklyRankings;
    
    NSString *weekString = @"";
    
    if(weekNumber > 0)
        weekString = [NSString stringWithFormat:@"%ld", (long)weekNumber];
    
    NSString *requestURL = [NSString stringWithFormat:@"%@weekly-rankings/json/%@/%@/%@/", REST_API_URL, API_KEY, [Utils getStringFromPositionType:positionType], weekString];
    
    [self startRequest:requestURL method:HTTP_GET postData:nil];
}

#pragma mark - Get Weekly Projections Request
- (void)getWeeklyProjectionsByPositionType:(PositionType)positionType forWeekNumber:(NSInteger)weekNumber withDelegate:(id)delegate
{
    self.delegate = delegate;
    
    self.requestType = RequestTypeWeeklyProjections;
    
    NSString *weekString = @"";
    
    if(weekNumber > 0)
        weekString = [NSString stringWithFormat:@"%ld", (long)weekNumber];
    
    NSString *requestURL = [NSString stringWithFormat:@"%@weekly-projections/json/%@/%@/%@/", REST_API_URL, API_KEY, [Utils getStringFromPositionType:positionType], weekString];
    
    [self startRequest:requestURL method:HTTP_GET postData:nil];
}

#pragma mark - Make the Request
- (void)startRequest:(NSString *)requestStr method:(NSString *)httpMethod postData:(NSData *)postData
{
    if(self.currentTask)
        return;
    
    if(!self.session)
        self.session = [self configureSession];
    
    NSLog(@"\nREQUEST: %@", requestStr);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestStr]];
    [request setHTTPMethod:httpMethod];
    
    if(postData)
    {
        NSString *jsonString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
        NSLog(@"\nPOST DATA: %@", jsonString);
        
        request.HTTPBody = postData;
    }
    
    self.responseData = [NSMutableData data];
    
    self.currentTask = [self.session dataTaskWithRequest:request];
    
    [self.currentTask resume];
}

#pragma mark - NSURLSessionTaskDelegate Methods
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    self.responseData.length = 0;
    
    self.response = (NSHTTPURLResponse *)response;
    
    NSInteger status = [self.response statusCode];
    NSLog(@"GOT RESPONSE STATUS CODE: %ld", (long)status);
    
    if(status == HTTP_CODE_SUCCESS)
    {
        completionHandler(NSURLSessionResponseAllow);
    }
    else
    {
        NSString *statusMessage = [NSString stringWithFormat:@"Received bad status code: %li", (long)self.response.statusCode];
        
        if(self.delegate)
        {
            [self.delegate apiManager:self didReturnError:statusMessage];
        }
        
         NSLog(@"%@", statusMessage);
    }
    
    self.currentTask = nil;
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    self.currentTask = nil;
    
    if(error)
    {
        NSLog(@"REQUEST ERROR: %@", error);
        
        if(self.delegate)
           [self.delegate apiManager:self didReturnError:error.localizedDescription];
    }
    else
    {
        NSString *str = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
        NSLog(@"\nRESPONSE RECEIVED: %@", str);
        
        id jsonData = [self parseJSONResponse:self.responseData];
        
        if(self.delegate)
            [self.delegate apiManager:self didReturnData:jsonData];
    }
}

@end
