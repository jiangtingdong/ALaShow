//
//  ALAHotTopModel.h
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/2.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 "commentNum": 6,
 "imgUrl": "showImg/20151225134848453205.jpg",
 "goodsId": 0,
 "height": 1024,
 "publishTime": "2015-12-25 13:48:49",
 "nickName": "二马三石",
 "userId": 51,
 "width": 1024,
 "userIcon": "userIcon/20151225134600135.jpg",
 "showId": 344,
 "upvoteNum": 7,
 "shareContent": "生活不只是苟且，还有诗和远方"
 */
@interface ALAHotTopModel : NSObject
@property (nonatomic, assign) NSInteger commentNum;
@property (nonatomic, copy)   NSString *imgUrl;
@property (nonatomic, assign) NSInteger goodsId;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, copy)   NSString *publishTime;
@property (nonatomic, copy)   NSString *nickName;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, copy)   NSString *userIcon;
@property (nonatomic, assign) NSInteger showId;
@property (nonatomic, assign) NSInteger upvoteNum;
@property (nonatomic, copy)   NSString *shareContent;

- (instancetype)initWithDictionary:(NSDictionary*)dict;
+ (instancetype)hotTopWithDictionary:(NSDictionary *)dict;
+ (NSMutableArray *)hotTopModelFromDictionaryArray:(NSArray *)dictArray;
@end
