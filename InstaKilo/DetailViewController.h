//
//  DetailViewController.h
//  InstaKilo
//
//  Created by Ben Weinberg on 2017-03-22.
//  Copyright © 2017 Ben Weinberg. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "Athletes.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (nonatomic) Athletes *athletes;
@end
