//
//  REViewController.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/22/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "REViewController.h"
#import "REGooglePlaceSearch.h"
#import <AFNetworking/AFNetworking.h>

@implementation REViewController

- (void)viewDidLoad {
    
    REGooglePlaceSearch *query = [[REGooglePlaceSearch alloc]init];
    
    query.placeSearchRequestType = REGooglePlaceNearBySearch;
    
    query.placeSearchName = @"Lupita";
    
    query.placeSearchLocation =  @"17.989167,-92.928056";
    
    query.placeSearchSensor = @"false";
    
    query.placeSearchRadius = @"500";

    
    

//
//    NSDictionary *d = [MTLJSONAdapter JSONDictionaryFromModel:query];
//    
//    NSLog(@"%@",d);
    
    REGooglePlacesClient *client = [REGooglePlacesClient sharedGooglePlacesClient];
    
    client.delegate = self;
    
    [client REGooglePlaceSearchRequest:query];

//    REGooglePlacesClient *client = [REGooglePlacesClient sharedGooglePlacesClient];
//    
//    client.delegate = self;
//    
//    [client REGooglePlaceNearBySearchByTerm:@"restaurant"];
//    
//    [client REGooglePlaceTextSearchByTerm:@"restaurants in Mexico"];
//
//    [client REGooglePlaceRadarSearchByTerm:@"restaurants in Mexico"];

    [super viewDidLoad];
}

- (void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundNearByPlaces:(NSArray *)places {
    
    NSLog(@"%@",places);
}

-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundTextSearchPlaces:(NSArray *)places {
    NSLog(@"%@",places);
}

-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundRadarSearchPlaces:(NSArray *)places {
    NSLog(@"%@",places);
}

- (void)REGooglePlacesClient:(REGooglePlacesClient *)client didFailWithError:(NSError *)error {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Places"
                                                        message:[NSString stringWithFormat:@"%@",error]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end