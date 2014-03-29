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

/* Returns an array of places based on the client request
*/
-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundPlaces:(NSArray *)places;

/* Returns a place detail based on the client request
 */
-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundPlace:(REGooglePlace *)place;

/* Returns a fail message based on the client request
 */
-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFailWithMessage:(NSString *)message;

/* Returns a fail NSError object based on the client request
 */
-(void)REGooglePlacesClient:(REGooglePlacesClient *)client didFailWithError:(NSError *)error;

@end