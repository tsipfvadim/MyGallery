//
//  TVViewController.m
//  MyGallery
//
//  Created by Admin on 27.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TVViewController.h"

@interface TVViewController ()
@end

@implementation TVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __block NSMutableArray *tmpAssets = [[NSMutableArray alloc] init];
    ALAssetsLibrary *assetsLibrary = [TVViewController defaultAssetsLibrary];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
            {
                [tmpAssets addObject:result];
            }
        }];
        
        _photos = [[NSArray alloc] initWithArray:tmpAssets];
        [_collectionView reloadData];
    } failureBlock:^(NSError *error) {
        NSLog(@"Error loading images %@", error);
    }];
}

+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _photos.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = (PhotoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    ALAsset *asset = _photos[indexPath.row];
    cell.asset = asset;
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *controller=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SecondViewController"];
    controller.photos=_photos;
    controller.numberOfPhoto=indexPath.row;
    
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
