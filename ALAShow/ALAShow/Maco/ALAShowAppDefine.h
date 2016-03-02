//
//  ALAShowAppDefine.h
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/1.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#ifndef ALAShowAppDefine_h
#define ALAShowAppDefine_h

#define KColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define KRandomColor    [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1]

#define KSysVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#define KWeakSelf   typeof(self) __weak weakSelf = self



#endif /* ALAShowAppDefine_h */
