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
             @"placeId": @"id",
             @"placeName": @"name",

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
