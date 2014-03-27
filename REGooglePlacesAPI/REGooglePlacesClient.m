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

//#error "Obtain an API Key from Google Developer Console"
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

- (void)REGooglePlaceSearchRequest:(REGooglePlaceSearch *)search {
    
    NSDictionary *d = [MTLJSONAdapter JSONDictionaryFromModel:search];
    
    NSString * urlRequest = [NSString stringWithFormat:@"%@/%@/%@?key=%@",REGooglePlaceAPIBaseURL,
                                                                          search.placeSearchRequestType,
                                                                          search.placeSearchOutput,
                                                                          REGooglePlaceAPIKey];
    [self GET:urlRequest parameters:d
      success:^(NSURLSessionDataTask *task, id responseObject) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundPlaces:)]) {
              
              if (![[responseObject objectForKey:@"status"] isEqualToString:@"OK"]) {
                  
                  [self.delegate REGooglePlacesClient:self
                                     didFailWithMessage:[responseObject objectForKey:@"error_message"]];
                  
              }else{
        
                  NSArray *results = [responseObject objectForKey:@"results"];
                  
                  NSValueTransformer *transformer;
                  
                  transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
                  
                NSArray *places = [transformer transformedValue:results];
                  
                  [self.delegate REGooglePlacesClient:self
                                 didFoundPlaces: places];
              }
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
              [self.delegate REGooglePlacesClient:self
                                 didFailWithError:error];
          }
      }];
}

- (void)REGooglePlaceDetail:(REGooglePlace *)place withSearchRequest:(REGooglePlaceSearch *)search {
    
    NSDictionary *d = [MTLJSONAdapter JSONDictionaryFromModel:search];
    
    NSString * urlRequest = [NSString stringWithFormat:@"%@/%@?reference=%@&key=%@",REGooglePlaceAPIBaseURL,
                             search.placeSearchRequestType,
                             place.placeReference,
                             REGooglePlaceAPIKey];
    
    [self GET:urlRequest parameters:d
      success:^(NSURLSessionDataTask *task, id responseObject) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundPlaces:)]) {
              
              if (![[responseObject objectForKey:@"status"] isEqualToString:@"OK"]) {
                  
                  [self.delegate REGooglePlacesClient:self
                                   didFailWithMessage:[responseObject objectForKey:@"error_message"]];
                  
              }else{
                  
                  NSArray *results = [responseObject objectForKey:@"result"];
                  
                  NSValueTransformer *transformer;
                  
                  transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
                  
                  NSArray *places = [transformer transformedValue:results];
                  
                  [self.delegate REGooglePlacesClient:self
                                       didFoundPlaces: places];
              }
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          
          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
              [self.delegate REGooglePlacesClient:self
                                 didFailWithError:error];
          }
      }];
}

//- (void)REGooglePlaceNearBySearchByTerm:(NSString *)searchTerm {
//
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    
//    parameters[@"location"] = @"17.989167,-92.928056";
//   
//    parameters[@"radius"] = @(500);
//    
//    parameters[@"types"] = @"food";
//    
//    parameters[@"name"] = searchTerm;
//    
//    parameters[@"sensor"] = @"false";
//    
//    parameters[@"key"] = REGooglePlaceAPIKey;
//
//    [self GET:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?" parameters:parameters
//                                                                                  success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundNearByPlaces:)]) {
//            
//            NSArray *results = [responseObject objectForKey:@"results"];
//            
//            NSValueTransformer *transformer;
//            
//            transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
//            
//            NSArray *places = [transformer transformedValue:results];
//            
//            [self.delegate REGooglePlacesClient:self
//                                 didFoundNearByPlaces: places];
//        }
//    
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        
//        if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
//            [self.delegate REGooglePlacesClient:self
//                               didFailWithError:error];
//        }
//    }];
//}

//- (void)REGooglePlaceTextSearchByTerm:(NSString *)searchTerm {
//    
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    
//    parameters[@"query"] = searchTerm;
//    
//    parameters[@"sensor"] = @"false";
//    
//    parameters[@"key"] = REGooglePlaceAPIKey;
//    
//    [self GET:@"https://maps.googleapis.com/maps/api/place/textsearch/json?" parameters:parameters
//      success:^(NSURLSessionDataTask *task, id responseObject) {
//          
//          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundTextSearchPlaces:)]) {
//              
//              NSArray *results = [responseObject objectForKey:@"results"];
//              
//              NSValueTransformer *transformer;
//              
//              transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
//              
//              NSArray *places = [transformer transformedValue:results];
//              
//              [self.delegate REGooglePlacesClient:self
//                             didFoundTextSearchPlaces: places];
//          }
//          
//      } failure:^(NSURLSessionDataTask *task, NSError *error) {
//          
//          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
//              [self.delegate REGooglePlacesClient:self
//                                 didFailWithError:error];
//          }
//      }];
//}
//
//- (void)REGooglePlaceRadarSearchByTerm:(NSString *)searchTerm {
//    
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    
//    parameters[@"location"] = @"17.989167,-92.928056";
//    
//    parameters[@"radius"] = @(5000);
//    
//    parameters[@"types"] = @"food";
//
////    parameters[@"query"] = searchTerm;
//    
//    parameters[@"sensor"] = @"false";
//    
//    parameters[@"key"] = REGooglePlaceAPIKey;
//    
//    [self GET:@"https://maps.googleapis.com/maps/api/place/radarsearch/json?" parameters:parameters
//      success:^(NSURLSessionDataTask *task, id responseObject) {
//          
//          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFoundRadarSearchPlaces:)]) {
//              
//              NSArray *results = [responseObject objectForKey:@"results"];
//              
//              NSValueTransformer *transformer;
//              
//              transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:REGooglePlace.class];
//              
//              NSArray *places = [transformer transformedValue:results];
//              
//              [self.delegate REGooglePlacesClient:self
//                         didFoundRadarSearchPlaces: places];
//          }
//          
//      } failure:^(NSURLSessionDataTask *task, NSError *error) {
//          
//          if ([self.delegate respondsToSelector:@selector(REGooglePlacesClient:didFailWithError:)]) {
//              [self.delegate REGooglePlacesClient:self
//                                 didFailWithError:error];
//          }
//      }];
//
//}


@end
