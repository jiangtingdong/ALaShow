//
//  ALAHotTopFlowLayout.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/3.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import "ALAHotTopModel.h"
#import "ALAHotTopFlowLayout.h"

@interface ALAHotTopFlowLayout()
@property (nonatomic, strong) NSArray *layoutAttributes;

@end


@implementation ALAHotTopFlowLayout

- (void)prepareLayout
{
    
   
    CGFloat contentWidth = self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right;
    CGFloat itemwidth = (contentWidth - (self.columnCount - 1) * self.minimumInteritemSpacing)/self.columnCount;
    // 2. 计算布局属性
    [self attributes:itemwidth];
}
- (void)attributes:(CGFloat)itemWidth
{
    // 定义一个列高的数组，记录每一列最大的高度
    CGFloat colHeight[self.columnCount];
    for (int i = 0; i < self.columnCount; ++i) {
        colHeight[i] = self.sectionInset.top;
    }
    // 定义总item高
    CGFloat totoalItemHeight = 0;
    // 遍历 dataList 数组计算相关的属性
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:self.dataList.count];
    
    NSInteger index = 0;
    for (ALAHotTopModel *model in self.dataList) {
        // 1> 建立布局属性
        NSIndexPath *path = [NSIndexPath indexPathForItem:index inSection:0];
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
        // 2> 计算当前列数
        NSInteger col = index % self.columnCount;
        // 3> 设置frame
        // X
        CGFloat x = self.sectionInset.left + col * (itemWidth + self.minimumInteritemSpacing);
        // Y
        CGFloat y = colHeight[col];
        // height
        CGFloat h = [self imageHeightWith:CGSizeMake(model.width, model.height) itemWidth:itemWidth];
        CGFloat lableHiget = [self YYHreturnStringHeight:model.shareContent Width:itemWidth Font:14];
         h= h + lableHiget + 44;
        totoalItemHeight += h;
        attr.frame = CGRectMake(x, y, itemWidth, h);
        
        // 4> 累加列高
        colHeight[col] += h + self.minimumLineSpacing;
        
        index++;
        
        [arrayM addObject:attr];
    }
    
    // 设置 itemSize，使用总高度的平均值
    self.itemSize = CGSizeMake(itemWidth, totoalItemHeight / self.dataList.count);
    
    // 给属性数组设置数值
    self.layoutAttributes = arrayM.copy;
}


- (CGFloat)YYHreturnStringHeight:(NSString *)string Width:(CGFloat)width Font:(int)font{
    CGRect frame = [string boundingRectWithSize:CGSizeMake(width, 10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName] context:nil];
    return frame.size.height;
}
- (CGFloat)imageHeightWith:(CGSize)size itemWidth:(CGFloat)itemWidth {
    return size.height / size.width * itemWidth;
}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    return self.layoutAttributes;
}

-(NSArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
@end
