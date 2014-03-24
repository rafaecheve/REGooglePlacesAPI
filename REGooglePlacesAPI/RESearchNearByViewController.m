//
//  RESearchNearByViewController.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/23/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "RESearchNearByViewController.h"
#import "REGooglePlaceSearch.h"
#import "REGooglePlace.h"
#import "REPlaceTableViewCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface RESearchNearByViewController ()

@property (weak, nonatomic) IBOutlet UITableView *placesTableView;
@property (strong, nonatomic) NSArray *placesArray;

@end

@implementation RESearchNearByViewController

- (void)viewDidLoad {
    
    REGooglePlaceSearch *searchNearyBy = [[REGooglePlaceSearch alloc]init];
    
    searchNearyBy.placeSearchRequestType = REGooglePlaceNearBySearch;
    
    searchNearyBy.placeSearchOutput = @"json";

    //required parameters
    
    //Villahermosa
    
    //searchNearyBy.placeSearchLocation =  @"17.989167,-92.928056";

    //Sidney Australia
    searchNearyBy.placeSearchLocation =  @"-37.813611,144.963056";

    searchNearyBy.placeSearchRadius = @"2000";
    
    searchNearyBy.placeSearchSensor = @"false";

    searchNearyBy.placeSearchTypes = @"food";
    
    //optional parameters

    searchNearyBy.placeSearchName = @"salad";
    
    //using client to request

    REGooglePlacesClient *client = [REGooglePlacesClient sharedGooglePlacesClient];
    
    client.delegate = self;
    
    [client REGooglePlaceSearchRequest:searchNearyBy];
    
    [super viewDidLoad];
}

- (void)REGooglePlacesClient:(REGooglePlacesClient *)client didFoundPlaces:(NSArray *)places {
    
    self.placesArray = places;
    
    [self.placesTableView reloadData];
}

- (void)REGooglePlacesClient:(REGooglePlacesClient *)client didFailWithMessage:(NSString *)message{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Places"
                                                        message:[NSString stringWithFormat:@"%@",message]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [self.placesArray count];
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
     static NSString *CellIdentifier = @"REPlaceTableViewCell";
     
     REPlaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     
     if (cell == nil) {
         
         NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"REPlaceTableViewCell" owner:nil options:nil];
         
         for (UIView *view in views) {
             if([view isKindOfClass:[UITableViewCell class]])
             {
                 cell = (REPlaceTableViewCell*)view;
             }
         }
     }

     REGooglePlace * place = [self.placesArray objectAtIndex:indexPath.row];
     
     cell.lblPlaceName.text = place.placeName;
     cell.lblPlaceVicinity.text = place.placeVicinity;
     
     [cell.imgPlaceIcon setImageWithURL:[NSURL URLWithString:place.placeIcon]
                    placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
     
 return cell;
     
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@end
