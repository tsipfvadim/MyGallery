//
//  PhotoCell.m
//  MyGallery
//
//  Created by Admin on 27.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void) setAsset:(ALAsset *)asset
{
    _asset = asset;
    _imageView.image = [UIImage imageWithCGImage:[asset thumbnail]];
    _imageName.text=[[asset defaultRepresentation] filename];
}
@end
