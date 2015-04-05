//
//  CRSGalleryImporterTheme.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

@import UIKit;

@protocol CRSGalleryImporterTheme <NSObject>

@property (strong, nonatomic, readonly) UIFont *navigationTitleFont;
@property (strong, nonatomic, readonly) UIColor *navigationTintColor;
@property (strong, nonatomic, readonly) UIColor *backgrounColor;

@end
