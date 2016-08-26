//
//  ViewController.h
//  Product Catalog
//
//  Created by Carlos E. Villalpando on 8/26/16.
//  Copyright © 2016 Organo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "Intro.h"

@interface Start : UIViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

