//
//  PhotoCell.h
//  MyGallery
//
//  Created by Admin on 27.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoCell : UICollectionViewCell
@property(nonatomic, strong) ALAsset *asset;
@property(nonatomic, weak) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *imageName;

@end
