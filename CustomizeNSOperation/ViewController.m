//
//  ViewController.m
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import "ViewController.h"
#import "ImageDownloader.h"
#import "ImageCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ImageDownloader *downloader = [[ImageDownloader alloc] init];
//    [downloader downloadPic:@"https://www.baidu.com/img/bd_logo1.png"];
//    
    ImageCache *cacher = [[ImageCache alloc] init];
    NSString *str2 = [cacher md5HexDigest:@"huangchuqi"];
    NSLog(@"%s", str2.UTF8String);
}



@end
