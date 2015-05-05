//
//  CRSGalleryViewController.m
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 21/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSGalleryViewController.h"
#import "CRSGalleryViewModel.h"
#import "CRSAlbumsViewController.h"

@interface CRSGalleryViewController ()

@property (strong, nonatomic) CRSGalleryViewModel *viewModel;
@property (strong, nonatomic) UINavigationController *navAlbumsViewController;

@end

@implementation CRSGalleryViewController

- (instancetype)initWithViewModel:(CRSGalleryViewModel *)viewModel
             navAlbumsViewController:(UINavigationController *)navAlbumsViewController {
    if (self = [super init])
    {
        _viewModel = viewModel;
        _navAlbumsViewController = navAlbumsViewController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        self.navAlbumsViewController.view.frame = self.view.frame;
        [self.navAlbumsViewController willMoveToParentViewController:self];
        [self addChildViewController:self.navAlbumsViewController];
        [self.view addSubview:self.navAlbumsViewController.view];
        [self.navAlbumsViewController didMoveToParentViewController:self];
    }
}







@end
