//
//  CRSGalleryViewModel.h
//  CRSMediaImporterExample
//
//  Created by Carlos Roig on 21/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CRSAssetsInteractor;

@interface CRSGalleryViewModel : NSObject

- (instancetype)initWithAssetsInteractor:(CRSAssetsInteractor *)assetsInteractor ;
- (NSString *)selectedElementsInGallery;

@end
