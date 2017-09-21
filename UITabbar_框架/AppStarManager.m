//
//  AppStarManager.m
//  UITabBar框架
//
//  Created by 孟博 on 2017/9/19.
//  Copyright © 2017年 tgkj. All rights reserved.
//

#import "AppStarManager.h"
#import "UINavigationController+CLNavigationController.h"
#import "AppDelegate.h"
#import "LLTabBar.h"
#import "LLTabBarItem.h"
#import "ViewController_First.h"
#import "ViewController_Second.h"
#import "ViewController_Third.h"
#import "ViewController_Fourth.h"

@interface AppStarManager ()<LLTabBarDelegate>
{
    UITabBarController *TabbarVC;
    UINavigationController *RootNavi;
    LLTabBar *lltabbar;
    LLTabBarItem *rankItem;
    LLTabBarItem *homeItem;
    LLTabBarItem *publishItem;
    LLTabBarItem *gameItem;
}
@end

@implementation AppStarManager
//全局变量
static id _instance = nil;
//单例方法
+(instancetype)sharedSingleton{
    return [[self alloc] init];
}
////alloc会调用allocWithZone:
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
//初始化方法
- (instancetype)init{
    // 只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}
//copy在底层 会调用copyWithZone:
- (id)copyWithZone:(NSZone *)zone{
    return  _instance;
}
+ (id)copyWithZone:(struct _NSZone *)zone{
    return  _instance;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return _instance;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

- (void)StarApp{
    ViewController_First *FirstVC = [[ViewController_First alloc]init];
    ViewController_Second *SecondVC = [[ViewController_Second alloc]init];
    ViewController_Third *ThirdVC = [[ViewController_Third alloc]init];
    ViewController_Fourth * Fourth = [[ViewController_Fourth alloc]init];
    UINavigationController *navc1 = [[UINavigationController alloc]initWithRootViewController:FirstVC];
    UINavigationController *navc2 = [[UINavigationController alloc]initWithRootViewController:SecondVC];
    UINavigationController *navc3 = [[UINavigationController alloc]initWithRootViewController:ThirdVC];
    UINavigationController *navc4 = [[UINavigationController alloc]initWithRootViewController:Fourth];
    TabbarVC = [[UITabBarController alloc]init];
    TabbarVC.viewControllers = @[navc1,navc2,navc3,navc4];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor grayColor]];
//    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setHidden:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //init custom tabbar
    lltabbar = [self LLTabbarInitWithFrame:TabbarVC.tabBar.bounds];
    [TabbarVC.tabBar addSubview:lltabbar];
    RootNavi = [[UINavigationController alloc]initWithRootViewController:TabbarVC];
    [[UIApplication sharedApplication].delegate.window setRootViewController:TabbarVC];
}

#pragma mark - LLTabbar init method
-(LLTabBar *)LLTabbarInitWithFrame:(CGRect)bounds{
    LLTabBar *tabBar = [[LLTabBar alloc] initWithFrame:bounds];
    
    // 下方tabbar增加个分割线 － michaelin 20160728
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    line.backgroundColor = KCColor(242, 242, 242, 255);
    [tabBar addSubview:line];
    
    CGFloat tabBarHeight = CGRectGetHeight(tabBar.frame);
    CGFloat publishItemWidth = (SCREEN_WIDTH / 3);
    CGFloat normalButtonWidth = (SCREEN_WIDTH - publishItemWidth) / 3;
    
        homeItem = [self tabBarItemWithFrame:CGRectMake(0, 0, normalButtonWidth, tabBarHeight)
                                       title:@"直播"
                             normalImageName:@"tabbar_home"
                           selectedImageName:@"tabbar_home_c" tabBarItemType:LLTabBarItemLive];
        rankItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth, 0, normalButtonWidth, tabBarHeight)
                                       title:@"排行"
                             normalImageName:@"tabbar_rank"
                           selectedImageName:@"tabbar_rank_c" tabBarItemType:LLTabBarItemRank];
        publishItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2, 0, publishItemWidth, tabBarHeight)
                                          title:@"开播"
                                normalImageName:@"tabbar_me"
                              selectedImageName:@"tabbar_me_c" tabBarItemType:LLTabBarItemRise];
        gameItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
                                       title:@"活动"
                             normalImageName:@"tabbar_activity"
                           selectedImageName:@"tabbar_activity_c" tabBarItemType:LLTabBarItemGame];
    [homeItem setExclusiveTouch:YES];
    [rankItem setExclusiveTouch:YES];
    [publishItem setExclusiveTouch:YES];
    [gameItem setExclusiveTouch:YES];
    tabBar.tabBarItems = @[homeItem, rankItem, publishItem, gameItem];
    tabBar.delegate = self;
    
    return tabBar;
    
}
-(LLTabBarItem *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(LLTabBarItemType)tabBarItemType {
    LLTabBarItem *item = [[LLTabBarItem alloc] initWithFrame:frame];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:10];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setImage:selectedImage forState:UIControlStateHighlighted];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:KCColor(255,71,71,255) forState:UIControlStateSelected];
    item.tabBarItemType = tabBarItemType;
    return item;
}

#pragma mark - Tabbar delegate
- (void)tabBarDidSelectedRiseButton:(LLTabBarItem *) sender{
    if (sender.tabBarItemType == LLTabBarItemRise) {
        [self startCameraAnimation:sender];
    } else if (sender.tabBarItemType == LLTabBarItemLive) {
        [self startCameraAnimation:sender];
    } else {
        [self startCameraAnimation:sender];
    }
}

-(void)startCameraAnimation:(LLTabBarItem *) sender{
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    [sender.imageView.layer addAnimation:animation forKey:[NSString stringWithFormat:@"%lu", (unsigned long)sender.tabBarItemType]];
}

@end
