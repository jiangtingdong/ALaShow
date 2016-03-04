//
//  ALAHotTopCell.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/3.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import "ALAHotTopCell.h"

#import <UIImageView+WebCache.h>
@interface ALAHotTopCell()

@property (weak, nonatomic) IBOutlet UIImageView *hotTopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shsreContentLabel;
@end

@implementation ALAHotTopCell


-(void)setModel:(ALAHotTopModel *)model
{
    _model = model;
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@", self.imgPath,model.imgUrl]);
    [self.hotTopImageView  sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.imgPath,model.imgUrl]]];
    self.shsreContentLabel.text = model.shareContent;
}


@end
