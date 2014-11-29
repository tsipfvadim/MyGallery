//
//  SecondViewController.m
//  MyGallery
//
//  Created by Admin on 27.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "SecondViewController.h"
#import "EditViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController {
    BOOL _fullScreen;
    CGRect _scrollFrame;
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
    _fullScreen=NO;
    [self initScrollWithImage];
    
    UILongPressGestureRecognizer *longPressRecognizer =
    [[UILongPressGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(fullScreen)];
    longPressRecognizer.minimumPressDuration = 1;
    longPressRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:longPressRecognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitFullSceen)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [_scrollView addGestureRecognizer:tapRecognizer];
    
    
}

- (void)initScrollWithImage{
    ALAsset *asset = _photos[_numberOfPhoto];
    ALAssetRepresentation *defaultRep = [asset defaultRepresentation];
    UIImage*image=[UIImage imageWithCGImage:[defaultRep fullScreenImage]];
    
    [_imageView removeFromSuperview];
    _imageView = [[UIImageView alloc] initWithImage:image];
    _imageView.frame = (CGRect){.origin=CGPointMake(0.0, 0.0), .size=image.size};
    _scrollView.contentSize = image.size;
    [_scrollView addSubview:_imageView];
    
    CGRect scrollViewFrame = _scrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / _scrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / _scrollView.contentSize.height;
    _scrollView.minimumZoomScale = MIN(scaleWidth, scaleHeight);
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.zoomScale = MIN(scaleWidth, scaleHeight);;
    [_scrollView zoomScale];
}



- (IBAction)prevPhoto:(id)sender {
    if (_numberOfPhoto>0) {
        _numberOfPhoto-=1;
        [self initScrollWithImage];
    }
}

- (IBAction)nextPhoto:(id)sender {
    if (_numberOfPhoto<[_photos count]-1) {
        _numberOfPhoto+=1;
        [self initScrollWithImage];
    }
}

- (void)fullScreen{
    if (!_fullScreen) {
    _scrollFrame=_scrollView.frame;
    _scrollView.frame = self.view.frame;
    _fullScreen=YES;
    }
}

- (void)exitFullSceen{
    if (_fullScreen) {
        _scrollView.frame=_scrollFrame;
        _fullScreen=NO;
    }
}

- (IBAction)zoomIn:(id)sender {
    CGFloat newZoomScale = _scrollView.zoomScale * 1.5f;
    _scrollView.zoomScale = MIN(newZoomScale, _scrollView.maximumZoomScale);
    [_scrollView zoomScale];
}

- (IBAction)zoomOut:(id)sender {
    CGFloat newZoomScale = _scrollView.zoomScale / 1.5f;
    _scrollView.zoomScale = MAX(newZoomScale, _scrollView.minimumZoomScale);
[_scrollView zoomScale];
}

- (IBAction)editImage:(id)sender {
    EditViewController *controller=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EditViewController"];
    controller.asset=_photos[_numberOfPhoto];
    [self.navigationController pushViewController:controller animated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
