//
//  ViewController.m
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import "ViewController.h"
#import "ImageDownloader.h"
#import "ImageLoadDelegate.h"
@interface ViewController () <ImageLoadDelegate>

@end

@implementation ViewController
{
    int picCount;
    int picY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark ImageLoadDelegate
- (void)finishLoadingImage:(UIImage *)image
{
    @synchronized (self) //加个锁稳妥点，不加的话可能全局变量picCount这些会乱
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(picCount*100, picY*80, 50, 50)];
        imageView.image = image;
        [self.view addSubview:imageView];
        picCount++;
        if (picCount == 4) {
            picCount = 0;
            picY++;
        }
    }
}
- (IBAction)clickDownloadBtn:(id)sender
{
    ImageDownloader *downloader = [[ImageDownloader alloc] init];
//    ImageDownloader *downloader = [ImageDownloader sharedInstance];
    downloader.delegate = self;
//    [downloader downloadPic:@"https://www.baidu.com/img/bd_logo1.png"];
    [downloader downloadPics:@[@"https://www.baidu.com/img/bd_logo1.png",@"http://j.jikexueyuan.com/Current/home/offline/web/build/static/image/title.png",@"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg"]];
}

@end
