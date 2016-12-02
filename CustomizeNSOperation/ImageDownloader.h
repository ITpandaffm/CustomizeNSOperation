//
//  DownloadPic.h
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloader : NSObject


- (void)downloadPic:(NSString *)strURL;
- (void)downloadPics:(NSArray<NSString *> *)strURLArr;


@end
