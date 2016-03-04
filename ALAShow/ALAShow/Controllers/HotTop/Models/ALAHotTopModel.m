//
//  ALAHotTopModel.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/2.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import "ALAHotTopModel.h"

@implementation ALAHotTopModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)hotTopWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}


+ (NSMutableArray *)hotTopModelFromDictionaryArray:(NSArray *)dictArray
{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        ALAHotTopModel *model = [self hotTopWithDictionary:dict];
        [tempArray addObject:model];
    }
    return tempArray.copy;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
