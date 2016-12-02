//
//  ImageCache.m
//  CustomizeNSOperation
//
//  Created by ffm on 16/12/2.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import "ImageCache.h"
#import <CommonCrypto/CommonDigest.h>
@implementation ImageCache



// md5加密
- (NSString *)md5HexDigest:(NSString*)input
{
    // 1. 导入库文件
    //    #import <CommonCrypto/CommonDigest.h>
    
    // 需要MD5加密的字符
    const char* str = [input UTF8String];
    // 设置字符加密后存储的空间
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    // 参数三：编码的加密机制
    CC_MD5(str, (UInt32)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%2s",result];
    }
    return ret;
}
//md5 32位 加密 （小写）
- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (UInt32)strlen(cStr), result);
    NSString *fileName = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15]];
    return fileName;
}



@end
