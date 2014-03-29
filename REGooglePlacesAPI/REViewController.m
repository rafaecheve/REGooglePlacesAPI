//
//  REViewController.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/22/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "REViewController.h"
#import "REGooglePlaceSearch.h"
#import <AFNetworking/AFNetworking.h>
#import "REGooglePlacesClient.h"

@implementation REViewController

- (void)viewDidLoad {
    
//    NSDictionary *d = [MTLJSONAdapter JSONDictionaryFromModel:query];

    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDeletePlacePressed:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"reference"] = @"CkQxAAAA72XrJc8GiODrcrKpc6_PmDLCLX3Thh-8bV_zEB_XPgGYvHBjZP9p8ZQWfZKWf0TT4RncIYy_0F-T568amdhXyxIQY4ZoNK7uLhK7MJ37rsO_BRoUmjGK1EItAs9F3zfmlJoC-79r200";
    
    [manager POST:@"https://maps.googleapis.com/maps/api/place/delete/json?sensor=true&key=AIzaSyBnZA7KGHAKm9J39HEl-mVk3i0DjByK6QM" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (IBAction)btnCreatePlacePressed:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
    
    location[@"lat"] = @(17.850045);
    location[@"lng"] = @(-93.158554);
    
    parameters[@"location"] = location;
    parameters[@"name"] = @"Escuela Urbana Rosario Castellanos";

    NSArray *types = [NSArray arrayWithObject:@"school"];
    
    parameters[@"types"] = types;
    
    parameters[@"accuracy"] = @"10";

    parameters[@"language"] = @"es";
    
    [manager POST:@"https://maps.googleapis.com/maps/api/place/add/json?sensor=false&key=AIzaSyBnZA7KGHAKm9J39HEl-mVk3i0DjByK6QM" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

//{
//    "duration" : 172800,
//    "language" : "EN-CA",
//    "reference" : "CnRkAAAAGnBVNFDeQoOQHzgdOpOqJNV7K9-etc",
//    "summary" : "Rock n Roll Dreams: The band fully electric in my kitchen and drinking all my beer.",
//    "url" : "http://www.example.com/event_details/10476.html"
//}

- (IBAction)btnCreateEventPressed:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"duration"] = @(86000);
    parameters[@"language"] = @"ES-MX";
    parameters[@"reference"] = @"CpQBhQAAAOa6wTvM9cHcjxZaX2kZ3k9YSKKJALZug6QUZ1crYBKr2LdEKtQYbirxInQzMcgbY2Cg360iTLb3F1cPsrcqV5dZJGFgLLK_6ZMxUAUbbmFCOW4N7hbGhWaPZG3dhqhbvfn45hIYVZNvLNRTRyHB_Gy3Mbr22qjClAghoQGI9RsvHOiW9U89_LFzFlnSy3EpeRIQWImmFXTy-epJ0nYzbXR-rBoUWTlhj2UcZGqAoVidnn6Zxvt6mag";
    
    parameters[@"summary"] = @"Fiesta en la Feria";
    parameters[@"url"] = @"http://rafaecheve.com";

    [manager POST:@"https://maps.googleapis.com/maps/api/place/event/add/json?sensor=false&key=AIzaSyBnZA7KGHAKm9J39HEl-mVk3i0DjByK6QM" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

- (IBAction)btnDeleteEventPressed:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"reference"] = @"CpQBhQAAAOa6wTvM9cHcjxZaX2kZ3k9YSKKJALZug6QUZ1crYBKr2LdEKtQYbirxInQzMcgbY2Cg360iTLb3F1cPsrcqV5dZJGFgLLK_6ZMxUAUbbmFCOW4N7hbGhWaPZG3dhqhbvfn45hIYVZNvLNRTRyHB_Gy3Mbr22qjClAghoQGI9RsvHOiW9U89_LFzFlnSy3EpeRIQWImmFXTy-epJ0nYzbXR-rBoUWTlhj2UcZGqAoVidnn6Zxvt6mag";
    
    parameters[@"event_id"] = @"DWrYAg1rxf0";
    
    [manager POST:@"https://maps.googleapis.com/maps/api/place/event/delete/json?sensor=true&key=AIzaSyBnZA7KGHAKm9J39HEl-mVk3i0DjByK6QM" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}




@end