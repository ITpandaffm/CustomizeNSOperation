//
//  DownloadPic.h
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//把Downloader

#import <Foundation/Foundation.h>
#import "ImageLoadDelegate.h"
@interface ImageDownloader : NSObject

@property (nonatomic, weak) id<ImageLoadDelegate> delegate;

- (void)downloadPic:(NSString *)strURL;
- (void)downloadPics:(NSArray<NSString *> *)strURLArr;

+ (instancetype)sharedInstance;

@end
