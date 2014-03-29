//
//  REGooglePlacesClient.h
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/22/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

static NSString * const REGooglePlaceAPIBaseURL = @"https://maps.googleapis.com/maps/api/place";

@protocol REGooglePlacesClientDelegate;


#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

#import "REGooglePlaceSearch.h"
#import "REGooglePlace.h"

@interface REGooglePlacesClient : AFHTTPSessionManager

+ (REGooglePlacesClient *)sharedGooglePlacesClient;

@property (nonatomic, weak) id<REGooglePlacesClientDelegate>delegate;

- (void)REGooglePlaceSearchRequest:(REGooglePlaceSearch *)search;
- (void)REGooglePlaceDetail:(REGooglePlace *)place withSearchRequest:(REGooglePlaceSearch *)search;
//- (void)REGooglePlaceNearBySearchByTerm:(NSString *)searchTerm;
//- (void)REGooglePlaceTextSearchByTerm:(NSString *)searchTerm;
//- (void)REGooglePlaceRadarSearchByTerm:(NSString *)searchTerm;

@end

@protocol REGooglePlacesClientDelegate <NSObject>

@optional

-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundPlaces:(NSArray *)places;
-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundPlace:(REGooglePlace *)place;

-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFailWithMessage:(NSString *)message;

//-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundNearByPlaces:(NSArray *)places;
//-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundTextSearchPlaces:(NSArray *)places;
//-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundRadarSearchPlaces:(NSArray *)places;

-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFailWithError:(NSError *)error;

@end