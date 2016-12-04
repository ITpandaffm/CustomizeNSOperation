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

@interface ImageDownloader () 


@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) ImageCache *cacher;

@end

static ImageDownloader *_instance = nil;
@implementation ImageDownloader

#pragma mark public Methods
- (void)downloadPic:(NSString *)strURL
{
    //在内存里面找是否下载过
    if ([self.cacher imageIsExistInRAM:strURL])
    {
        NSLog(@"在内存中找到了噢");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [self.cacher imageLoadFromRAM:strURL];
            [self.delegate finishLoadingImage:image];
        });
        return;
    }
    //在文件中找是否下载过
    if ([self.cacher imageIsExistInDisk:strURL]) {
        NSLog(@"在文件中找到了噢");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [self.cacher imageLoadFromDIsk:strURL];
            [self.delegate finishLoadingImage:image];
        });
        return;
    }
    
    
    
    //若都没有，则开始下载，别忘了下载完成之后记得要把图片存入缓存
    ImageDownloadOperation *downloadNSOperation = [[ImageDownloadOperation alloc] initWithURL:strURL];

    [self.queue addOperation:downloadNSOperation];
    downloadNSOperation.downloadCompleteBlock = ^(UIImage *image){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate finishLoadingImage:image];
        });
        /*
         放入内存
         */
        if ([self.cacher saveImageToRAM:image withImageURL:strURL]) {
            NSLog(@"文件保存到内存里成功！");
        } else {
            NSLog(@"文件写入到内存里失败噢");
        }
        /*
         写入文件
         */
        if ([self.cacher saveImageToDisk:image withImageURL:strURL]) {
            NSLog(@"图片成功保存到文件里了噢");
        } else {
            NSLog(@"图片保存到文件里失败了噢");
        }
    };

}

- (void)downloadPics:(NSArray<NSString *> *)strURLArr
{
    for (NSString *strURL in strURLArr)
    {
        [self downloadPic:strURL];
    }
}

#pragma mark 单例
+ (instancetype)sharedInstance
{
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
//        instance = [[ImageDownloader allocWithZone:nil] init];
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [ImageDownloader sharedInstance];
}
- (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return [ImageDownloader sharedInstance] ;
}

#pragma mark 设置最大并发数
- (void)setMaxConcurrentCount:(int)maxNum
{
    self.queue.maxConcurrentOperationCount = maxNum;
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
