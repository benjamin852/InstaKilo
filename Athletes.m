//
//  Athletes.m
//  InstaKilo
//
//  Created by Ben Weinberg on 2017-03-22.
//  Copyright © 2017 Ben Weinberg. All rights reserved.
//

#import "Athletes.h"

@implementation Athletes
- (instancetype) initWithImage:(UIImage*)image withName:(NSString*)name {
    self = [super init];
    if (self) {
        _image = image;
        _name = name;
    }
    return self;
}
@end
