//
//  ALAHotTopVC.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/2.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import "ALAHotTopVC.h"

@interface ALAHotTopVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *showGoodsCV;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *showGoodsLayout;

@end
static NSString *reuseID  = @"ALAShowGoodsCell";
@implementation ALAHotTopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
    return cell;
}

- (UICollectionViewFlowLayout *)showGoodsLayout
{
    if (!_showGoodsLayout) {
        _showGoodsLayout.minimumLineSpacing = 20;
        _showGoodsLayout.minimumInteritemSpacing = 40;
        
    }
    return _showGoodsLayout;
}
@end
