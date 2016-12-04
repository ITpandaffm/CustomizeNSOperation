//
//  MyNSOperation.h
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageLoadDelegate.h"

typedef void (^DownloadCompleteBlock)(UIImage *);

@interface ImageDownloadOperation : NSOperation

@property (nonatomic, copy) DownloadCompleteBlock downloadCompleteBlock;
@property (nonatomic, copy) NSString *strURL;

- (instancetype)initWithURL:(NSString *)strURL;

@end



