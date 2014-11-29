//
//  EditViewController.m
//  MyGallery
//
//  Created by Admin on 28.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController{
    CIContext *_context;
    CIFilter *_filter;
    CIImage *_beginImage;
    UIImageOrientation _orientation;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ALAssetRepresentation *defaultRep = [_asset defaultRepresentation];
    _orientation=UIImageOrientationUp;
    UIImage*image= [UIImage imageWithCGImage:[defaultRep fullScreenImage]];
    _imageView.image=image;
    _beginImage =[[CIImage alloc] initWithImage:image];
    _context = [CIContext contextWithOptions:nil];
    _filter = [CIFilter filterWithName:@"CISepiaTone"
                         keysAndValues: kCIInputImageKey, _beginImage,
               @"inputIntensity", @0.5, nil];
    _textField.text=[defaultRep filename];
}

- (IBAction)saveImage:(id)sender {
    
    ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
    CIImage *saveToSave = [_filter outputImage];
    CGImageRef cgImage = [_context createCGImage:saveToSave
                                        fromRect:[saveToSave extent]];
    [library writeImageToSavedPhotosAlbum:cgImage
                              orientation:(ALAssetOrientation)_orientation
                          completionBlock:nil];
    CGImageRelease(cgImage);
}
- (IBAction)sliderValueChanged:(id)sender {
    
    CIImage *outputImage = [_filter outputImage];
    CGImageRef cgImage = [_context createCGImage:outputImage
                                        fromRect:[outputImage extent]];
    _imageView.image = [UIImage imageWithCGImage:cgImage
                                           scale:1.0
                                     orientation: _orientation];
    CGImageRelease(cgImage);
}

- (IBAction)rotateLeft:(id)sender {
    switch(_orientation) {
        case UIImageOrientationLeft:
        {
            _orientation=UIImageOrientationDown;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: _orientation];
        }
            break;
        case UIImageOrientationRight:
        {
            _orientation=UIImageOrientationUp;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: UIImageOrientationDown];
        }
            break;
        case UIImageOrientationDown:
        {
            _orientation=UIImageOrientationRight;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: UIImageOrientationLeft];
        }
            break;
        default:
        {
            _orientation=UIImageOrientationLeft;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: UIImageOrientationRight];
        }
            _beginImage =[_beginImage initWithImage:_imageView.image];
    }
}

- (IBAction)rotateRight:(id)sender {
    switch(_orientation) {
        case UIImageOrientationLeft:
        {
            _orientation=UIImageOrientationUp;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: _orientation];
        }
            break;
        case UIImageOrientationRight:
        {
            _orientation=UIImageOrientationDown;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: UIImageOrientationDown];
        }
            break;
        case UIImageOrientationDown:
        {
            _orientation=UIImageOrientationLeft;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: UIImageOrientationLeft];
        }
            break;
        default:
        {
            _orientation=UIImageOrientationRight;
            _imageView.image = [UIImage imageWithCGImage:[_imageView.image CGImage]
                                                   scale:1.0
                                             orientation: UIImageOrientationRight];
        }
            _beginImage =[_beginImage initWithImage:_imageView.image];
    }
}

- (IBAction)changeFilter:(id)sender {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            _filter = [CIFilter filterWithName:@"CISepiaTone"
                                 keysAndValues: kCIInputImageKey, _beginImage,
                       @"inputIntensity", @0.5, nil];
            _slider.userInteractionEnabled = YES;
            break;
        case 1:
            _filter = [CIFilter filterWithName:@"CIPhotoEffectChrome"
                                 keysAndValues: kCIInputImageKey, _beginImage, nil];
            _slider.userInteractionEnabled = NO;
            break;
        case 2:
            _filter = [CIFilter filterWithName:@"CIColorInvert"
                                 keysAndValues: kCIInputImageKey, _beginImage, nil];
            _slider.userInteractionEnabled = NO;
            break;
        case 3:
            _filter = [CIFilter filterWithName:@"CIPhotoEffectInstant"
                                 keysAndValues: kCIInputImageKey, _beginImage, nil];
            _slider.userInteractionEnabled = NO;
            break;
        case 4:
            _filter = [CIFilter filterWithName:@"CIPhotoEffectMono"
                                 keysAndValues: kCIInputImageKey, _beginImage, nil];
            _slider.userInteractionEnabled = NO;
            break;
        case 5:
            _filter = [CIFilter filterWithName:@"CIPhotoEffectNoir"
                                 keysAndValues: kCIInputImageKey, _beginImage, nil];
            _slider.userInteractionEnabled = NO;
            break;
        default:
            break;
    }
    CIImage *outputImage = [_filter outputImage];
    CGImageRef cgImage = [_context createCGImage:outputImage
                                        fromRect:[outputImage extent]];
    _imageView.image = [UIImage imageWithCGImage:cgImage
                                           scale:1.0
                                     orientation: _orientation];
    CGImageRelease(cgImage);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
