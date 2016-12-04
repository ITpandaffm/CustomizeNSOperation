//
//  MyNSOperation.m
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import "ImageDownloadOperation.h"

@implementation ImageDownloadOperation

- (instancetype)initWithURL:(NSString *)strURL
{
    self = [super init];
    if (self)
    {
        self.strURL = strURL;
    }
    return self;
}

- (void)main
{
    NSURL *url = [NSURL URLWithString:self.strURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (data)
    {
        UIImage *image = [UIImage imageWithData:data];
        if (self.downloadCompleteBlock)
        {
            self.downloadCompleteBlock(image);
        } else
        {
            NSLog(@"没有实现block方法噢");
        }
    } else
    {
        NSLog(@"下载图片失败了噢，看看是不是网络环境不好？");
    }
}


@end
