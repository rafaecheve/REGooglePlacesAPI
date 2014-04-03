//
//  REGooglePlace.h
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

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface REGooglePlace : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly)NSString * placeFormatedAddress;
@property (copy, nonatomic, readonly)NSString * placeGeometry;
@property (copy, nonatomic, readonly)NSString * placeIcon;

@property (copy, nonatomic, readonly)NSString * placeId;
@property (copy, nonatomic, readonly)NSString * placeName;

@property (copy, nonatomic, readonly)NSString * placeRating;
@property (copy, nonatomic, readonly)NSString * placeReference;
@property (copy, nonatomic, readonly)NSString * placeVicinity;

// additional parameters on details

/* placePriceLevel on the place
 */
@property (copy, nonatomic, readonly)NSString * placePriceLevel;

/* placeFormattedPhone if place has one
 */
@property (copy, nonatomic, readonly)NSString * placeFormattedPhone;

/* placeInternationalPhone if place has one
 */
@property (copy, nonatomic, readonly)NSString * placeInternationalPhone;

/* placeOpeningHours are the opening hours added by users
 */
@property (copy, nonatomic, readonly)NSString * placeOpeningHours;

/* placeUrl if the place has one url
 */
@property (copy, nonatomic, readonly)NSString * placeUrl;

/* placeWebsite if the place has one website
 */
@property (copy, nonatomic, readonly)NSString * placeWebsite;

/* placeTypes attribute by this place
 */
@property (copy, nonatomic, readonly)NSArray * placeTypes;

/* photos taken by users in the place
 */
@property (copy, nonatomic, readonly)NSArray * placePhotos;

/* events made by users in the place
 */
@property (copy, nonatomic, readonly)NSArray * placeEvents;

/* placeReviews made by users in the place
 */
@property (copy, nonatomic, readonly)NSArray * placeReviews;

/* placeAddressComponents in a place
 */
@property (copy, nonatomic, readonly)NSArray * placeAddressComponents;

@end
