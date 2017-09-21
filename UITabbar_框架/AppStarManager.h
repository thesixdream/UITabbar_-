//
//  AppStarManager.h
//  UITabBar框架
//
//  Created by 孟博 on 2017/9/19.
//  Copyright © 2017年 tgkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppStarManager : NSObject
//单例方法
+(instancetype)sharedSingleton;
-(void)StarApp;
@end
