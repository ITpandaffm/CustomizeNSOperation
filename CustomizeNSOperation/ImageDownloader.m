//
//  DownloadPic.m
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import "ImageDownloader.h"
#import "ImageDownloadOperation.h"

@interface ImageDownloader ()

@property (nonatomic, strong) NSMutableDictionary *downloadDict;
@property (nonatomic, strong) NSOperationQueue *queue;


@end




@implementation ImageDownloader

#pragma mark public Methods
- (void)downloadPic:(NSString *)strURL
{
    ImageDownloadOperation *downloadNSOperation = [[ImageDownloadOperation alloc] initWithURL:strURL];
    [self.queue addOperation:downloadNSOperation];
}

- (void)downloadPics:(NSArray<NSString *> *)strURLArr
{
    
}


#pragma mark 懒加载
- (NSMutableDictionary *)downloadDict
{
    if (!_downloadDict)
    {
        _downloadDict = [NSMutableDictionary dictionary];
    }
    return _downloadDict;
}
- (NSOperationQueue *)queue
{
    if (!_queue)
    {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}


@end
