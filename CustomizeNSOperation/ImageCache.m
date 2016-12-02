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


@end
