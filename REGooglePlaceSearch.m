//
//  REGooglePlaceSearch.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/23/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "REGooglePlaceSearch.h"

NSString * const REGooglePlaceNearBySearch = @"nearbysearch";
NSString * const REGooglePlaceTextSearch = @"textsearch";
NSString * const REGooglePlaceRadarSearch = @"radarsearch";

@implementation REGooglePlaceSearch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"placeSearchOutput": @"output",
             @"placeSearchLocation": @"location",
             @"placeSearchRadius": @"radius",
             @"placeSearchSensor": @"sensor",
             @"placeSearchKeyword": @"keyword",
             @"placeSearchLanguage": @"language",
             @"placeSearchMinPrice": @"minprice",
             @"placeSearchMaxPrice": @"maxprice",
             @"placeSearchName": @"name",
             @"placeSearchOpenNow": @"opennow",
             @"placeSearchRankBy": @"rankby",
             @"placeSearchProminence": @"prominense",
             @"placeSearchDistance": @"distance",
             @"placeSearchTypes": @"types",
             @"placeSearchPageToken": @"pagetoken",
             @"placeSearchZagatSelected": @"zagatselected",
             @"placeSearchRequestType": NSNull.null,
             };
}

- (NSDictionary *)dictionaryValue {
    NSMutableDictionary *modifiedDictionaryValue = [[super dictionaryValue] mutableCopy];
    
    for (NSString *originalKey in [super dictionaryValue]) {
        if ([self valueForKey:originalKey] == nil) {
            [modifiedDictionaryValue removeObjectForKey:originalKey];
        }
    }
    
    return [modifiedDictionaryValue copy];
}

+ (NSValueTransformer *)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)HTMLURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)assigneeJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:REGooglePlaceSearch.class];
}

@end
