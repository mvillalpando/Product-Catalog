//
//  Intro.m
//  Product Catalog
//
//  Created by Carlos E. Villalpando on 8/26/16.
//  Copyright © 2016 Organo. All rights reserved.
//

#import "Intro.h"

@interface Intro ()

@end

@implementation Intro

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"fancy_deboss.png"]]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    self.lblIntro.text  = maIntroTitles[self.iPageIndex];
    self.imgIntro.image    = [UIImage imageNamed:maIntroImgs[self.iPageIndex]];
    }

@end
