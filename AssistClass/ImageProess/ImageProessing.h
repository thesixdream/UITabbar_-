//
//  Imageproessing.h
//  LiveCL
//
//  Created by chenyan on 15/11/30.
//  Copyright © 2015年 tiange. All rights reserved.
//此类用于解决各种图片处理

#import <UIKit/UIKit.h>

@interface ImageProessing : UIImage

/**
 *  对图像进行九宫格切分 拉伸
 *
 *  @param strPath 图片地址
 *  @return UIImage 拉伸后新的图像
 */
+(UIImage*) setImageCutNine:(NSString *)strPath;


/**
 *  保存图像到本地
 *
 *  @param image 数据源
 *  @param imageName 图像名称
 *  @param extension 图像的类型
 *  @param directoryPath 保存的路径
 *  @return NSString 如果成功，返回保存的本地路径，否则为nil
 */
+(NSString*) saveImage:(UIImage *)image
     withFileName:(NSString *)imageName
           ofType:(NSString *)extension
      inDirectory:(NSString *)directoryPath;


/**
 *  从本地加载图像
 *
 *  @param filePath 图片路径地址
 *  @return UIImage 返回读取到的数据
 */
+(UIImage *) loadImage:(NSString *)filePath;

/**
 *  图像模糊处理
 *
 *  @param theImage 需要处理的图像
 *  @return 返回处理完成的图像
 */

+(UIImage*) blur:(UIImage*)theImage;
/**
 *  图像模糊处理
 *
 *  @param theImage 需要处理的图像
 *  @param myFloat 模糊程度
 *  @return 返回处理完成的图像
 */
+(UIImage*) blur:(UIImage*)theImage withFloat:(CGFloat) myFloat;

/**
 *  图片旋转
 *
 *  @param aImage 需要选择的图
 *
 *  @return 旋转之后的图
 */
+(UIImage *)rotateImage:(UIImage *)aImage;

/**
 *  镜像旋转
 *
 *  @param src 待旋转的图片
 *
 *  @return 旋转之后的图
 */
+(UIImage *) mirrorTheImage:(UIImage *)src;

/**
 *  图片等笔缩放
 *
 *  @param image     需要缩放的图片
 *  @param scaleSize 缩放系数
 *
 *  @return 返回缩放的图片
 */
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

/**
 *  UIImage 转24位GRB
 *
 *  @param image 需要转换的图片
 *
 *  @return RGB数据
 */
+(char *) convertUIImageToBitmapRGB:(UIImage *) image;

+(char *) convertUIImageToBitmapRGBA:(UIImage *) image;

/**
 *  创建上下文环境
 *
 *  @param image 填入图像
 *
 *  @return 返回环境
 */
+(CGContextRef) newBitmapRGBContextFromImage:(CGImageRef) image;

//
+ (UIImage *) convertBitmapRGBA8ToUIImage:(char *) buffer
                                withWidth:(int) width
                               withHeight:(int) height;

/**
 *  自定义长宽
 *
 *  @param image 需要转换的图片
 *  @param reSize 转换的尺寸
 *
 *  @return 转换完成的数据
 */
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

+(UIImage *)reSizeImage2:(UIImage *)image toSize:(CGSize)reSize;

/**
 *  openGL截图
 *
 *
 *  @return 返回截到的图像
 */
+(UIImage *) glToUIImage;

+(BOOL) checkALLBlack:(char*)buff width:(int)nWith height:(int)nHeight;

//十六进制颜色转换
+(UIColor *) colorWithHexString: (NSString *) stringToConvert;

//截取部分图像
+(UIImage*)getSubImage:(CGRect)rect Image:(UIImage *)image;
@end
