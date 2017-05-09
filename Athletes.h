//
//  Athletes.h
//  InstaKilo
//
//  Created by Ben Weinberg on 2017-03-22.
//  Copyright © 2017 Ben Weinberg. All rights reserved.
//

#import "UIKit/UIKit.h"

@interface Athletes : NSObject
@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *name;
- (instancetype) initWithImage:(UIImage*)image withName:(NSString*)name;
@end
