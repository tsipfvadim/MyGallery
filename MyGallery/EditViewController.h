//
//  EditViewController.h
//  MyGallery
//
//  Created by Admin on 28.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "TVViewController.h"

@interface EditViewController : UIViewController
@property (assign, nonatomic) ALAsset *asset;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)saveImage:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)rotateLeft:(id)sender;
- (IBAction)rotateRight:(id)sender;
- (IBAction)changeFilter:(id)sender;

@end
