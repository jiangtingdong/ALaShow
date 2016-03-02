//
//  ALANewFeatureVC.h
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/2.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^count)(NSString *imagePreFixName, NSInteger imageCount);
@interface ALANewFeatureVC : UIViewController

- (instancetype)initWithPreFixNameOfStartImage:(NSString *)preFixName andImageCount:(NSInteger)imageCount;
@end
