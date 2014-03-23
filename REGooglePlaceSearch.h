//
//  REGooglePlaceSearch.h
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/23/14.

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

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

extern NSString * const REGooglePlaceNearBySearch;
extern NSString * const REGooglePlaceTextSearch;
extern NSString * const REGooglePlaceRadarSearch;

@interface REGooglePlaceSearch : MTLModel <MTLJSONSerializing>

//options nearbysearch, textsearch, radarsearch
@property (copy, nonatomic, readwrite)NSString  * placeSearchRequestType;

//output indicates output in JavaScript Object Notation (JSON) xml indicates output as XML
@property (copy, nonatomic, readwrite)NSString * placeSearchOutput;

//location — The latitude/longitude around which to retrieve Place information. This must be specified as latitude,longitude.
@property (copy, nonatomic, readwrite)NSString * placeSearchLocation;

//radius — Defines the distance (in meters) within which to return Place results.
@property (copy, nonatomic, readwrite)NSString * placeSearchRadius;

//sensor — Indicates whether or not the Place request came from a device using a location sensor  to determine the location sent.
@property (copy, nonatomic, readwrite)NSString * placeSearchSensor;

//keyword — A term to be matched against all content that Google has indexed for this Place
@property (copy, nonatomic, readwrite)NSString * placeSearchKeyword;

//language — The language code, indicating in which language the results should be returned, if possible.
@property (copy, nonatomic, readwrite)NSString * placeSearchLanguage;

//minprice and maxprice (optional) — Restricts results to only those places within the specified range.
@property (copy, nonatomic, readwrite)NSString * placeSearchMinPrice;

//minprice and maxprice (optional) — Valid values range between 0 (most affordable) to 4 (most expensive)
@property (copy, nonatomic, readwrite)NSString * placeSearchMaxPrice;

//name — One or more terms to be matched against the names of Places
@property (copy, nonatomic, readwrite)NSString * placeSearchName;

//opennow — Returns only those Places that are open for business at the time the query is sent.
@property (copy, nonatomic, readwrite)NSString * placeSearchOpenNow;

//rankby — Specifies the order in which results are listed
@property (copy, nonatomic, readwrite)NSString * placeSearchRankBy;

//prominence (default). This option sorts results based on their importance.
@property (copy, nonatomic, readwrite)NSString * placeSearchProminence;

//distance. This option sorts results in ascending order by their distance from the specified location.
@property (copy, nonatomic, readwrite)NSString * placeSearchDistance;

//types — Restricts the results to Places matching at least one of the specified types.
@property (copy, nonatomic, readwrite)NSString * placeSearchTypes;

//pagetoken — Returns the next 20 results from a previously run search.
@property (copy, nonatomic, readwrite)NSString * placeSearchPageToken;

//zagatselected — The zagatselected parameter is experimental, and is only available to Places API enterprise customers.
@property (copy, nonatomic, readwrite)NSString * placeSearchZagatSelected;


@end
