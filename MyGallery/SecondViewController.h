//
//  SecondViewController.h
//  MyGallery
//
//  Created by Admin on 27.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface SecondViewController : UIViewController <UIScrollViewDelegate>
@property(nonatomic, assign) NSArray *photos;
@property(nonatomic, assign) NSInteger numberOfPhoto;
@property (strong, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)prevPhoto:(id)sender;
- (IBAction)nextPhoto:(id)sender;
- (IBAction)zoomOut:(id)sender;
- (IBAction)zoomIn:(id)sender;
- (IBAction)editImage:(id)sender;

@end
