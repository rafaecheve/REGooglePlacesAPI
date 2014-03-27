//
//  RERadarSearchViewController.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/23/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "RERadarSearchViewController.h"
#import "REGooglePlaceSearch.h"
#import "REGooglePlace.h"
#import "REPlaceTableViewCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface RERadarSearchViewController ()
@property (weak, nonatomic) IBOutlet UITableView *placesTableView;
@property (strong, nonatomic) NSArray *placesArray;
@end

@implementation RERadarSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    REGooglePlaceSearch *radarSearch = [[REGooglePlaceSearch alloc]init];
    
    radarSearch.placeSearchRequestType = REGooglePlaceRadarSearch;

    radarSearch.placeSearchOutput = @"json";
    
    radarSearch.placeSearchLocation = @"51.503186,-0.126446";
    
    radarSearch.placeSearchRadius = @"5000";
    
    radarSearch.placeSearchTypes = @"museum";

    radarSearch.placeSearchSensor = @"false";
    
    REGooglePlacesClient *client = [REGooglePlacesClient sharedGooglePlacesClient];
    
    client.delegate = self;
    
    [client REGooglePlaceSearchRequest:radarSearch];
    
    
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

- (void)didReceiveMemoryWarning
{
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
    
    cell.lblPlaceName.text = place.placeId;
    cell.lblPlaceVicinity.text = place.placeReference;
    
    [cell.imgPlaceIcon setImageWithURL:[NSURL URLWithString:place.placeIcon]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
