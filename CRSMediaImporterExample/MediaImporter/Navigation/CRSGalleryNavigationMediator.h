//
//  CRSGalleryNavigationMediator.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSUInteger, CRSGalleryNavigationType) {
    CRSGalleryNavigationPresent,
    CRSGalleryNavigationDismiss,
    CRSGalleryNavigationPush,
    CRSGalleryNavigationPop,
};

@interface CRSGalleryNavigationMediator : NSObject

- (void)navigateFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController withNavigationType:(CRSGalleryNavigationType)navigationType;

@end
