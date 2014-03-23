//
//  RESearchNearByViewController.h
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/23/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REGooglePlacesClient.h"

@interface RESearchNearByViewController : UIViewController <REGooglePlacesClientDelegate, UITableViewDelegate, UITableViewDataSource>

@end