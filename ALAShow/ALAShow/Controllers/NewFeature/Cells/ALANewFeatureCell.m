//
//  ALANewFeatureCell.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/1.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import "ALANewFeatureCell.h"

@implementation ALANewFeatureCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self layoutUI];
    }
    return self;
}

- (void)layoutUI
{
    self.startImageView = [[UIImageView alloc] initWithFrame:self.contentView.frame];
    [self.contentView addSubview: self.startImageView];
}



@end
