//
//  UINavigationController+CLNavigationController.m
//  CrystalLive
//
//  Created by 19kka on 15/11/20.
//  Copyright © 2015年 tiange. All rights reserved.
//

#import "UINavigationController+CLNavigationController.h"
#import "ImageProessing.h"

@implementation UINavigationController (CLNavigationController)

-(void)setTranslucentView{
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
//    self.navigationBar.translucent = YES;
//    [self setTitleTextColor:[UIColor whiteColor]];
//    self.navigationBar.tintColor = [UIColor whiteColor];
}
-(void)setNoTransViewNavigation
{
    //图片按九宫格拉伸 add by chy
//    UIImage *nvaImage            = [ImageProessing setImageCutNine:@"btn_lightblue_nor.png"];  //获取图片;
//    
//    [self.navigationBar setBackgroundImage:nvaImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    [self setTitleTextColor:[UIColor whiteColor]];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    [self setNavigationBarHidden:NO];
    self.navigationBar.hidden = NO;
    [self setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barTintColor = KCColor(28, 170, 241, 255);
}
-(void)setHiddenNavigationBar{
    self.navigationBar.hidden = YES;
}
-(void)setDisplayNavigationBar{
    self.navigationBar.hidden = NO;
}
-(void)setTranslucentViewAndCanClick{
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    [self setNavigationBarHidden:NO];
    self.navigationBar.hidden = NO;
    [self setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setTitleTextColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.f]];
}
-(void)setOtherTranslucentViewAndCanClick{
    UIImage *nvaImage            = [ImageProessing setImageCutNine:@"btn_lightblue_nor.png"];  //获取图片;

    [self.navigationBar setBackgroundImage:nvaImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    [self setTitleTextColor:[UIColor whiteColor]];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    [self setNavigationBarHidden:NO];
    self.navigationBar.hidden = NO;
    [self setStatusBarStyle:UIStatusBarStyleLightContent];
}
#pragma mark - private method
-(void)setTitleTextColor:(UIColor *)color
{
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :color}];
}
-(void)setStatusBarStyle:(UIStatusBarStyle)style
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [[UIApplication sharedApplication] setStatusBarStyle:style animated:NO];
}
@end
