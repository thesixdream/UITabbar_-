//
//  UINavigationController+CLNavigationController.h
//  CrystalLive
//
//  Created by 19kka on 15/11/20.
//  Copyright © 2015年 tiange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CLNavigationController)

/**
 *  透明的NavigationBar
 */
-(void)setTranslucentView;
/**
 *  恢复透明
 */
-(void)setNoTransViewNavigation;


/**
 *  去除navigationBar
 */
-(void)setHiddenNavigationBar;

/**
 *  恢复显示navigationBar
 */
-(void)setDisplayNavigationBar;

/**
 *  透明且可以穿透点击
 */
-(void)setTranslucentViewAndCanClick;
/**
 *  恢复
 */
-(void)setOtherTranslucentViewAndCanClick;
@end
