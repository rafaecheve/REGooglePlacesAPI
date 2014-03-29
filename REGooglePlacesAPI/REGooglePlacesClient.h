//
//  REGooglePlacesClient.h
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/22/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

/***********************************************************************************
 *
 * The MIT License (MIT)
 *
 * Copyright (c) 2014 Rafael Echeverria
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 *
 ***********************************************************************************/

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