//
//  ALAHotTopFlowLayout.h
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/3.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALAHotTopFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) NSInteger  columnCount;
@property (nonatomic, strong) NSArray *dataList;
@end
