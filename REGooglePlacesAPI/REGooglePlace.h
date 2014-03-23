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

@property (copy, nonatomic, readonly)NSString * placeId;
@property (copy, nonatomic, readonly)NSString * placeName;

@end
