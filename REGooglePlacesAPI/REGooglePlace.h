//
//  REGooglePlace.h
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/22/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

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
@property (copy, nonatomic, readonly)NSString * placePriceLevel;

@property (copy, nonatomic, readonly)NSString * placeFormattedPhone;
@property (copy, nonatomic, readonly)NSString * placeInternationalPhone;
@property (copy, nonatomic, readonly)NSString * placeOpeningHours;

@property (copy, nonatomic, readonly)NSString * placeUrl;
@property (copy, nonatomic, readonly)NSString * placeWebsite;


@property (copy, nonatomic, readonly)NSArray * placeTypes;
@property (copy, nonatomic, readonly)NSArray * placePhotos;
@property (copy, nonatomic, readonly)NSArray * placeEvents;
@property (copy, nonatomic, readonly)NSArray * placeReviews;
@property (copy, nonatomic, readonly)NSArray * placeAddressComponents;

@end
