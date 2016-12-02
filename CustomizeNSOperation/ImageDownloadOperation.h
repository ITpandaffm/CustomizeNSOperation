//
//  MyNSOperation.h
//  CustomizeNSOperation
//
//  Created by ffm on 16/11/29.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageDownloadDelegate.h"



@interface ImageDownloadOperation : NSOperation


@property (nonatomic, weak) id <ImageDownloadDelegate>delegate;
@property (nonatomic, copy) NSString *strURL;

- (instancetype)initWithURL:(NSString *)strURL;



@end



