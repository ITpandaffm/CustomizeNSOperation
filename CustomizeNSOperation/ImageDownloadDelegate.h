//
//  MyNSOperationDelegate.h
//  CustomizeNSOperation
//
//  Created by ffm on 16/12/2.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import <Foundation/Foundation.h>



@class ImageDownloadOperation;

@protocol ImageDownloadDelegate <NSObject>

@required
- (void)operation:(ImageDownloadOperation *)operation didDownloadImageFinish:(UIImage *)image;


@end

