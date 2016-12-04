//
//  ImageLoadDelegate.h
//  CustomizeNSOperation
//
//  Created by ffm on 16/12/4.
//  Copyright © 2016年 ITPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageLoadDelegate <NSObject>

- (void)finishLoadingImage:(UIImage *)image;

@end
