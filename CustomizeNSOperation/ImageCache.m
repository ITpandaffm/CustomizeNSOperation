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

@end

@implementation ImageCache

- (BOOL)imageIsExistInRAM:(NSString *)strURL
{
    if ([self.downloadMurDict.allKeys containsObject:strURL])
    {
        return true;
    }
    return false;
}

- (UIImage *)imageLoadFromRAM:(NSString *)strURL
{
    UIImage *image = self.downloadMurDict[strURL];
    return image;
}

- (BOOL)saveImageToRAM:(UIImage *)image withImageURL:(NSString *)strURL
{
    if (image)     //当传过来的image不为nil
    {
        [self.downloadMurDict setObject:image forKey:strURL];
    } else {
        NSLog(@"传过来的Image为nil噢");
    }
    return [self imageIsExistInRAM:strURL];
}

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

@end
