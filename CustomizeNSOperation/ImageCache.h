//
//  ImageCache.h
//  CustomizeNSOperation
//
//  Created by ffm on 16/12/2.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageCache : NSObject

//检查图片是否存在
- (BOOL)imageIsExistInRAM:(NSString *)strURL;
- (BOOL)imageIsExistInDisk:(NSString *)strURL;
//获取图片
- (UIImage *)imageLoadFromRAM:(NSString *)strURL;
- (UIImage *)imageLoadFromDIsk:(NSString *)strURL;
////存储图片
- (BOOL)saveImageToRAM:(UIImage *)image withImageURL:(NSString *)strURL;
- (BOOL)saveImageToDisk:(UIImage *)image withImageURL:(NSString *)strURL;

@end
