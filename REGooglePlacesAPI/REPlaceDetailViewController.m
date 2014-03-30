//
//  REPlaceDetailViewController.m
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/24/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import "REPlaceDetailViewController.h"

@interface REPlaceDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblPlacename;

@end

@implementation REPlaceDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    self.lblPlacename.text = self.placeDetail.placeName;

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
