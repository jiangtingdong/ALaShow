//
//  ALAHotTopCell.h
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/3.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAHotTopModel.h"

@interface ALAHotTopCell : UICollectionViewCell
@property (nonatomic, strong) ALAHotTopModel *model;
@property (nonatomic, copy) NSString *imgPath;
@end
