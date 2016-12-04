//
//  ImageCache.m
//  CustomizeNSOperation
//
//  Created by ffm on 16/12/2.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import "ImageCache.h"
#import <CommonCrypto/CommonDigest.h>



@interface ImageCache ()

@property (nonatomic, strong) NSMutableDictionary *downloadMurDict;
@property (nonatomic, copy) NSString *filePath;

- (NSString *)md5:(NSString *)str;


@end

@implementation ImageCache

#pragma mark 文件读写入内存
- (BOOL)imageIsExistInRAM:(NSString *)strURL
{
    NSString *codeStrURL = [self md5:strURL];
    if ([self.downloadMurDict.allKeys containsObject:codeStrURL])
    {
        return true;
    }
    return false;
}

- (UIImage *)imageLoadFromRAM:(NSString *)strURL
{
    NSString *codeStrURL = [self md5:strURL];
    UIImage *image = self.downloadMurDict[codeStrURL];
    return image;
}

- (BOOL)saveImageToRAM:(UIImage *)image withImageURL:(NSString *)strURL
{
    NSString *codeStrURL = [self md5:strURL];
    if (image)     //当传过来的image不为nil
    {
        [self.downloadMurDict setObject:image forKey:codeStrURL];
    } else {
        NSLog(@"传过来的Image为nil噢");
    }
    return [self imageIsExistInRAM:strURL];
}

#pragma mark 文件读写入文件夹里

- (BOOL)imageIsExistInDisk:(NSString *)strURL
{
    NSString *codeStrURL = [self md5:strURL];
    NSArray *allFiles = [[NSFileManager defaultManager] subpathsAtPath:self.filePath];
    if ([allFiles containsObject:codeStrURL]) {
        return true;
    }
    return false;
}

- (UIImage *)imageLoadFromDIsk:(NSString *)strURL
{
    NSString *codeStrURL = [self md5:strURL];
    NSData *imageDate = [[NSFileManager defaultManager] contentsAtPath:[self.filePath stringByAppendingPathComponent:codeStrURL]]; // 从一个文件中读取数据
    UIImage *image = [UIImage imageWithData:imageDate];
    return image;
}

- (BOOL)saveImageToDisk:(UIImage *)image withImageURL:(NSString *)strURL
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    NSString *codeStrURL = [self md5:strURL];
    return [[NSFileManager defaultManager] createFileAtPath:[self.filePath stringByAppendingPathComponent:codeStrURL] contents:data attributes:nil];
}

#pragma mark md5加密
//md5 32位 加密 （小写）
- (NSString *)md5:(NSString *)str
{
    // 1. 导入库文件
    //    #import <CommonCrypto/CommonDigest.h>
    // 需要MD5加密的字符
    const char *cStr = [str UTF8String];
    // 设置字符加密后存储的空间
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    // 参数三：编码的加密机制
    CC_MD5(cStr, (UInt32)strlen(cStr), result);
    NSString *fileName = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15]];
    return fileName;
}

#pragma mark 懒加载
- (NSMutableDictionary *)downloadMurDict
{
    if (!_downloadMurDict)
    {
        _downloadMurDict = [NSMutableDictionary dictionary];
    }
    return _downloadMurDict;
}
- (NSString *)filePath
{
    if (!_filePath)
    {
        // 获取Caches目录路径
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        _filePath = [paths firstObject];
    }
    return _filePath;
}


@end
