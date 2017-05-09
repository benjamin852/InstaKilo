//
//  CollectionViewCell.m
//  InstaKilo
//
//  Created by Ben Weinberg on 2017-03-22.
//  Copyright © 2017 Ben Weinberg. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (void) displayImage: (Athletes*) athleteImage {
    self.cellImage.image = athleteImage.image;
}
@end
