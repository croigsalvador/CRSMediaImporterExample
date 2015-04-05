//
//  CRSGalleryNavigationMediator.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSGalleryNavigationMediator.h"

@implementation CRSGalleryNavigationMediator

- (void)navigateFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController withNavigationType:(CRSGalleryNavigationType)navigationType  {
    
    switch (navigationType) {
        case CRSGalleryNavigationPresent:
            [fromViewController presentViewController:toViewController animated:YES completion:nil];
            break;
        case CRSGalleryNavigationDismiss:
            [fromViewController dismissViewControllerAnimated:YES completion:nil];
            break;
        case CRSGalleryNavigationPush:
            if (fromViewController.navigationController) {
                [fromViewController.navigationController pushViewController:toViewController animated:YES];
            }
            break;
        case CRSGalleryNavigationPop:
            if (fromViewController.navigationController) {
                [fromViewController.navigationController popViewControllerAnimated:YES];
            }
            break;
    }
}

@end
