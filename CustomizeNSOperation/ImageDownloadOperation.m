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
//    NSLog(@"%@", [NSThread currentThread]);
    if (data) {
        if ([self.delegate respondsToSelector:@selector(operation:didDownloadImageFinish:)]) {
            UIImage *image = [UIImage imageWithData:data];
            [self.delegate operation:self didDownloadImageFinish:image];
            /*
             放入内存
             */
            /*
             写入文件
             */
        } else {
            NSLog(@"没有实现operation:didDownloadImageFinish:方法噢");
        }
    } else {
        NSLog(@"下载图片失败了噢，快去看看是咋回事");
    }
}


@end
