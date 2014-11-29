//
//  TVViewController.h
//  MyGallery
//
//  Created by Admin on 27.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "PhotoCell.h"
#import "SecondViewController.h"

@interface TVViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSArray *photos;
+ (ALAssetsLibrary *)defaultAssetsLibrary;
@end
