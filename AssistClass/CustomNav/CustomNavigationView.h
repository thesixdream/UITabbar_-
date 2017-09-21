//
//  CustomNavigationView.h
//  LiveCL
//
//  Created by chenyan on 15/12/21.
//  Copyright © 2015年 tiange. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  用于左右按钮跳转的委托
 */
@protocol CustomNavDelegate <NSObject>
@optional
-(void)backClick;
-(void)rightClick;
@end

@interface CustomNavigationView : UIView

/**
 选择回调
 */
@property (nonatomic, assign)id<CustomNavDelegate> delegate;

/**
 *  初始化时，设置导航栏颜色
 *
 *  @param color 颜色值
 *  @return 返回初始化对象
 */
-(instancetype)initWithNavColor:(UIColor*)color;

/**
 *  设置返回按钮的标题和图片
 *
 *  @param strtitle 设置文字
 *  @param strImg   设置图片地址
 */
-(void) setBackBtnTitle:(NSString*)strtitle withImage:(NSString*)strImg;
/**
 *  设置导航栏标题
 *
 *  @param strtitle 标题文字
 */
-(void) setTitle:(NSString*)strtitle;
/**
 *  设置右边按钮标题和图片
 *
 *  @param strtitle 设置文字
 *  @param strImg   设置图片地址
 */
-(void) setRightBtnTitle:(NSString*)strtitle withImage:(NSString*)strImg;
/**
 *  由于返回按钮默认是显示的，需要调用此函数隐藏或者显示
 *
 *  @param bHidden 隐藏或者显示
 */
-(void) setBackHidden:(BOOL) bHidden;
/**
 *  禁用左侧按钮
 *
 *  @param bEnable 禁用或者启用
 */
- (void)setBackEnable:(BOOL)bEnable;
/*
 隐藏右侧按钮
 */
-(void)setRightHidden:(BOOL)bHidden;
@end
