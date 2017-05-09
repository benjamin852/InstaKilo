//
//  CollectionViewCell.h
//  InstaKilo
//
//  Created by Ben Weinberg on 2017-03-22.
//  Copyright © 2017 Ben Weinberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Athletes.h"

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
- (void) displayImage: (Athletes*) athleteImage;
@end
