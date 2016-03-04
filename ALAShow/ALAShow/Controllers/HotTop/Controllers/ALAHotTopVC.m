//
//  ALAHotTopVC.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/2.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//


#import "ALAHotTopCell.h"
#import "ALAHotTopModel.h"
#import "ALAHotTopVC.h"
#import <AFNetworking.h>
#import "ALAHotTopFlowLayout.h"


@interface ALAHotTopVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *showGoodsCV;
@property (weak, nonatomic) IBOutlet ALAHotTopFlowLayout *showGoodsLayout;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) NSString *imgPath;

@end
static NSString *reuseID  = @"ALAShowGoodsCell";
@implementation ALAHotTopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showGoodsCV.backgroundColor = [UIColor whiteColor];
    self.showGoodsLayout.columnCount = 2;
    self.showGoodsLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    [self  handleData];
}

- (void)handleData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:[NSString stringWithFormat:@"http://183.131.19.225/miyu/portal/portal.do?pageIndex=%zd&&pageSize=%zd",1,10] parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSDictionary *data = [responseObject objectForKey:@"data"];
        self.imgPath = [data objectForKey:@"imgPath"];
        self.dataArray = [ALAHotTopModel hotTopModelFromDictionaryArray:[data objectForKey:@"showList"]];
        self.showGoodsLayout.dataList = self.dataArray;
        [self.showGoodsCV reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"加载失败");
    }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALAHotTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.item];
    cell.imgPath = self.imgPath;
    return cell;
}


- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
@end
