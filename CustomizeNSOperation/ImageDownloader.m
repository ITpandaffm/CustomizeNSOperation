//
//  DownloadPic.m
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import "ImageDownloader.h"
#import "ImageDownloadOperation.h"
#import "ImageCache.h"

@interface ImageDownloader () <ImageDownloadDelegate>


@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) ImageCache *cacher;

@end

@implementation ImageDownloader

#pragma mark public Methods
- (void)downloadPic:(NSString *)strURL
{
    //在内存里面找是否下载过
    if ([self.cacher imageIsExistInRAM:strURL])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [self.cacher imageLoadFromRAM:strURL];
            [self.delegate finishLoadingImage:image];
        });
    }
    //在文件中找是否下载过
    
    //若都没有，则开始下载，别忘了下载完成之后记得要把图片存入缓存
    ImageDownloadOperation *downloadNSOperation = [[ImageDownloadOperation alloc] initWithURL:strURL];
    [self.queue addOperation:downloadNSOperation];
}

- (void)downloadPics:(NSArray<NSString *> *)strURLArr
{
    for (NSString *strURL in strURLArr)
    {
        [self downloadPic:strURL];
    }
}

#pragma mark ImageDownloadDelegate
- (void)operation:(ImageDownloadOperation *)operation didDownloadImageFinish:(UIImage *)image
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.delegate finishLoadingImage:image];
    });
}



#pragma mark 懒加载

- (NSOperationQueue *)queue
{
    if (!_queue)
    {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

- (ImageCache *)cacher
{
    if (!_cacher)
    {
        _cacher = [[ImageCache alloc] init];
    }
    return _cacher;
}

@end
