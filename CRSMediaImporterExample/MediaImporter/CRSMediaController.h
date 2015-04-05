//
//  CRSMediaManager.h
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 31/03/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSUInteger, CRSMediaType) {
    CRSMediaPictures,
    CRSMediaVideos,
    CRSMediaBoth
};

typedef void(^CRSMediaControllerCompletion)(NSArray *assets);

@protocol CRSMediaControllerDelegate;

@interface CRSMediaController : NSObject

+ (void)presentMediaControllerInViewController:(UIViewController *)viewController
                                     mediaType:(CRSMediaType)mediaType
                                    inDelegate:(id <CRSMediaControllerDelegate>)delegate;

+ (void)presentMediaControllerInViewController:(UIViewController *)viewController
                                     mediaType:(CRSMediaType)mediaType
                           withCompletionBlock:(CRSMediaControllerCompletion)completion;
@end

@protocol CRSMediaControllerDelegate <NSObject>

- (void)mediaController:(CRSMediaController *)mediaController didSelectAssets:(NSArray *)assets;

@end