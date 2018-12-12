//
//  ViewController.m
//  IrregularImageView
//
//  Created by 惠上科技 on 2018/12/12.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "ViewController.h"
#import "IrregularImageView.h"
@interface ViewController ()
@property (nonatomic, strong) IrregularImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[IrregularImageView alloc] initWithFrame:CGRectMake(100, 250, 150, 150)];
    _imageView.image = [UIImage imageNamed:@"WechatIMG200"];
    [self.view addSubview:_imageView];
}


@end
