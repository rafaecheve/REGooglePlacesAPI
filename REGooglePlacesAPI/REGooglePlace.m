//
//  REGooglePlace.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/22/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "REGooglePlace.h"

@implementation REGooglePlace

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"placeFormatedAddress": @"formatted_address",
             @"placeGeometry": @"geometry",
             @"placeIcon": @"icon",
             @"placeId": @"id",
             @"placeName": @"name",
             @"placeRating": @"rating",
             @"placeReference": @"reference",
             @"placeTypes": @"types",
             @"placeVicinity": @"vicinity"
             };
}

+ (NSValueTransformer *)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)HTMLURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)assigneeJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:REGooglePlace.class];
}

@end
