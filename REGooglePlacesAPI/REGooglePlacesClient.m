//
//  REGooglePlacesClient.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/22/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "REGooglePlacesClient.h"
#import "REGooglePlace.h"

static NSString * const REGooglePlaceAPIBaseURL = @"https://maps.googleapis.com/maps/api/place";
static NSString * const REGooglePlaceAPIKey     = @"AIzaSyBnZA7KGHAKm9J39HEl-mVk3i0DjByK6QM";


@implementation REGooglePlacesClient

+ (REGooglePlacesClient *)sharedGooglePlacesClient {
    
    static REGooglePlacesClient *_sharedGooglePlacesClient = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedGooglePlacesClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:REGooglePlaceAPIBaseURL]];
   
    });
    
    return _sharedGooglePlacesClient;
}


- (instancetype)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&sensor=false&key=AddYourOwnKeyHere


- (void)REGooglePlaceNearBySearchByTerm:(NSString *)searchTerm {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"location"] = @"17.989167,-92.928056";
   
    parameters[@"radius"] = @(500);
    
    parameters[@"types"] = @"food";
    
    parameters[@"name"] = searchTerm;
    
    parameters[@"sensor"] = @"false";
    
    parameters[@"key"] = REGooglePlaceAPIKey;

    [self GET:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?" parameters:parameters
                                                                                  success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundNearByPlaces:)]) {
            
            NSArray *results = [responseObject objectForKey:@"results"];
            
            NSValueTransformer *transformer;
            
            transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
            
            NSArray *places = [transformer transformedValue:results];
            
            [self.delegate REGooglePlacesClient:self
                                 didFoundNearByPlaces: places];
        }
    
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
            [self.delegate REGooglePlacesClient:self
                               didFailWithError:error];
        }
    }];
}

- (void)REGooglePlaceTextSearchByTerm:(NSString *)searchTerm {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"query"] = searchTerm;
    
    parameters[@"sensor"] = @"false";
    
    parameters[@"key"] = REGooglePlaceAPIKey;
    
    [self GET:@"https://maps.googleapis.com/maps/api/place/textsearch/json?" parameters:parameters
      success:^(NSURLSessionDataTask *task, id responseObject) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundTextSearchPlaces:)]) {
              
              NSArray *results = [responseObject objectForKey:@"results"];
              
              NSValueTransformer *transformer;
              
              transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
              
              NSArray *places = [transformer transformedValue:results];
              
              [self.delegate REGooglePlacesClient:self
                             didFoundTextSearchPlaces: places];
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
              [self.delegate REGooglePlacesClient:self
                                 didFailWithError:error];
          }
      }];
}

- (void)REGooglePlaceRadarSearchByTerm:(NSString *)searchTerm {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"location"] = @"17.989167,-92.928056";
    
    parameters[@"radius"] = @(5000);
    
    parameters[@"types"] = @"food";

//    parameters[@"query"] = searchTerm;
    
    parameters[@"sensor"] = @"false";
    
    parameters[@"key"] = REGooglePlaceAPIKey;
    
    [self GET:@"https://maps.googleapis.com/maps/api/place/radarsearch/json?" parameters:parameters
      success:^(NSURLSessionDataTask *task, id responseObject) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundRadarSearchPlaces:)]) {
              
              NSArray *results = [responseObject objectForKey:@"results"];
              
              NSValueTransformer *transformer;
              
              transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
              
              NSArray *places = [transformer transformedValue:results];
              
              [self.delegate REGooglePlacesClient:self
                         didFoundRadarSearchPlaces: places];
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
              [self.delegate REGooglePlacesClient:self
                                 didFailWithError:error];
          }
      }];

}


@end
