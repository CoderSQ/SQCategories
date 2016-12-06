//
//  ViewController.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/2.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+SQGradient.h"
#import "NSDate+SQExtentsion.h"
#import "UIImage+SQResize.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor sq_gradientColorFormColor:[UIColor blueColor] toColor:[UIColor redColor] withSize:self.view.bounds.size orientation:ColorGradientLeftToRigth];
    
    NSLog(@"%zd", [[NSDate date] sq_day]);
    NSLog(@"%zd", [[NSDate date] sq_hour]);
    NSLog(@"%zd", [[NSDate date] sq_minute]);
    
    UIImage *image = [UIImage imageNamed:@"11.jpg"];
    
    UIImage *newImage = [image sq_unifoimScaleToSize:CGSizeMake(300, 300)];
    self.imageView.image = newImage;
    [self.imageView sizeToFit];
    [self.view addSubview:self.imageView];
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [_imageView sizeToFit];
    }
    return _imageView;
}



@end
