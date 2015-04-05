//
//  CRSPictureCollectionViewCell.m
//  CRSGalleryImporter
//
//  Created by Carlos Roig on 04/04/15.
//  Copyright (c) 2015 CRoigSalvador. All rights reserved.
//

#import "CRSPictureCollectionViewCell.h"

@interface CRSPictureCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@end

@implementation CRSPictureCollectionViewCell

- (void)setAssetImage:(UIImage *)assetImage{
    self.pictureImageView.image = assetImage;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        // Add Border and 
    } else {
        // Remove
    }
}

@end
