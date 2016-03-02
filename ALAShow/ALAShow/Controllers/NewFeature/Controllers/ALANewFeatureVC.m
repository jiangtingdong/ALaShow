//
//  ALANewFeatureVC.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/2.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import "ALANewFeatureVC.h"
#import "ALANewFeatureCell.h"
#import <Masonry.h>

@interface ALANewFeatureVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *startView;
@property (nonatomic, strong) UIPageControl *countPageControl;
@property (nonatomic, assign) NSInteger imageCount;
@property (nonatomic, copy)   NSString *imageName;


@end
static NSString * const reuseIdentifier = @"startCell";
@implementation ALANewFeatureVC

- (instancetype)initWithPreFixNameOfStartImage:(NSString *)preFixName andImageCount:(NSInteger)imageCount
{
    if (self = [super init]) {
        self.imageCount =imageCount;
        self.imageName = preFixName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self startView];
    self.countPageControl.numberOfPages = self.imageCount;
    
    UIButton *enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [enterBtn  setTitle:@"立即体验" forState:UIControlStateNormal];
    [enterBtn setBackgroundColor:KRandomColor];
    [enterBtn addTarget:self action:@selector(enterMainViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterBtn];
    KWeakSelf;
    [enterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(-45);
        make.centerX.mas_equalTo(weakSelf.view);
    }];

}

- (void)enterMainViewController
{
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageCount;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALANewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
  
    cell.startImageView.image = [UIImage  imageNamed:[NSString stringWithFormat:@"%@%zd",self.imageName,indexPath.item +1]];
    self.countPageControl.currentPage = indexPath.row;
    
    return cell;
    
    
}


- (UICollectionView *)startView
{
    if (!_startView) {
        // 设置flowlayout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = self.view.frame.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        // 设置startView
        _startView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        [_startView registerClass:[ALANewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
        _startView.pagingEnabled = YES;
        _startView.bounces = NO;
        _startView.showsHorizontalScrollIndicator = NO;
        self.startView.delegate = self;
        self.startView.dataSource = self;
        [self.view addSubview:_startView];
        
    }
    return _startView;
}


- (UIPageControl *)countPageControl
{
    if (!_countPageControl) {
        _countPageControl =[[UIPageControl alloc] init];
        _countPageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _countPageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        _countPageControl.hidesForSinglePage = YES;
        [self.view addSubview:_countPageControl];
        KWeakSelf;
        [_countPageControl  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(weakSelf.view);
            make.bottom.equalTo(weakSelf.view).offset(-20);
        }];
        
    }
    return _countPageControl;
}
@end
