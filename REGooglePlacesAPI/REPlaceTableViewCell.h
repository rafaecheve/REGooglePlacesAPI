//
//  REPlaceTableViewCell.h
//  REGooglePlacesAPI
//
//  Created by Rafael Echeverria on 3/23/14.
//  Copyright (c) 2014 rafaecheve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REPlaceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblPlaceName;
@property (weak, nonatomic) IBOutlet UILabel *lblPlaceVicinity;
@property (weak, nonatomic) IBOutlet UIImageView *imgPlaceIcon;

@end
