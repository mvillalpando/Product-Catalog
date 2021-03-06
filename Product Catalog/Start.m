//
//  ViewController.m
//  Product Catalog
//
//  Created by Carlos E. Villalpando on 8/26/16.
//  Copyright © 2016 Organo. All rights reserved.
//

#import "Start.h"

@interface Start ()

@end

@implementation Start

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"fancy_deboss.png"]]];
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view, typically from a nib.
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    maIntroTitles   = [[NSMutableArray alloc] initWithObjects: @"“Todo comenzó con una extraordinaria taza de café” ORGANO™ comenzó en 2008 en Richmond, BC, Canadá, en una pequeña tienda con tan sólo tres empleados.", @"ORGANO™ es una compañía de Mercadeo en Red global con la misión de difundir el conocimiento del Ganoderma en el mundo entero. En todo el mundo, la gente está despertando al increíble sabor y a los beneficios de las bebidas, nutracéuticos y productos para el cuidado personal de categoría gourmet premium de ORGANO™.", @"¿Qué hace que los productos ORGANO™ sean tan especiales?Simplemente, es el Ganoderma; el oro detrás de ORGANO. El Ganoderma es un alimento básico utilizado en Asia y está ganando notoriedad en el mundo occidental.", @"Una vez que los hongos Ganoderma han sido transformados, el polvo es añadido a la familia de productos ORGANO™, incluyendo nuestras bebidas, productos de cuidado personal y por supuesto, en su forma más pura se puede encontrar en nuestra línea de productos nutracéuticos.", nil];
    
    maIntroImgs     = [[NSMutableArray alloc] initWithObjects: @"capuchino.jpg", @"woman.jpg", @"ganoderma.jpg", @"chocolate.jpg", nil];
    
    [self createPageViews];
}


//Funciones para el pageViewController
/**********************************************************************************************/
#pragma mark - Page controller methods and delegates
/**********************************************************************************************/
- (void)createPageViews {
    // Create page view controller
    self.pageViewController             = [self.storyboard instantiateViewControllerWithIdentifier:@"PageIntroController"];
    self.pageViewController.dataSource  = self;
    
    Intro *startingViewController       = [self viewControllerAtIndex:0];
    NSArray *viewControllers            = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    // Change the size of page view controller
    self.pageViewController.view.frame  = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    NSArray *subviews = self.pageViewController.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    thisControl.hidden = true;
}
//-------------------------------------------------------------------------------
- (Intro *)viewControllerAtIndex:(NSUInteger)index
{
    if (([maIntroTitles count] == 0) || (index >= [maIntroTitles count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    Intro *pageIntro            = [self.storyboard instantiateViewControllerWithIdentifier:@"Intro"];
    pageIntro.iPageIndex        = index;
    
    return pageIntro;
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [maIntroTitles count];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


- (IBAction)btnSkipPressed:(id)sender {
}

@end
