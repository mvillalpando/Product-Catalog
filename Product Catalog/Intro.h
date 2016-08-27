//
//  Intro.h
//  Product Catalog
//
//  Created by Carlos E. Villalpando on 8/26/16.
//  Copyright © 2016 Organo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"

@interface Intro : UIViewController
@property NSUInteger iPageIndex;
@property (strong, nonatomic) IBOutlet UILabel *lblIntro;
@property (strong, nonatomic) IBOutlet UIImageView *imgIntro;

@end
