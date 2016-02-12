//
//  JXTPushInButton.h
//  JXTPushInButton
//
//  Created by JXT on 16/2/12.
//  Copyright © 2016年 JXT. All rights reserved.
//
//  ***
//  *   GitHub:https://github.com/kukumaluCN/JXTPushInButton
//  *   博客:http://www.jianshu.com/users/c8f8558a4b1d/latest_articles
//  *   邮箱:1145049339@qq.com
//  ***


#import <UIKit/UIKit.h>

typedef void(^ClickBlock)();

@interface JXTPushInButton : UIButton

@property (nonatomic, copy) ClickBlock clickBlock;
@property (nonatomic, assign) CGFloat buttonScale;//缩小的比率，小于=1.0,大于0.0

//常规方法
+ (JXTPushInButton *)buttonWithType:(UIButtonType)type
                              frame:(CGRect)frame
                              title:(NSString *)title
                         titleColor:(UIColor *)color
                    backgroundColor:(UIColor *)backgroundColor
                    backgroundImage:(NSString *)image
                           andBlock:(ClickBlock)tempBlock;

//此方法初始化的按钮，点击后，在按钮frame内部松手，执行响应，拖出frame区域松手，响应取消
+ (JXTPushInButton *)touchUpOutsideCancelButtonWithType:(UIButtonType)type
                                                  frame:(CGRect)frame
                                                  title:(NSString *)title
                                             titleColor:(UIColor *)color
                                        backgroundColor:(UIColor *)backgroundColor
                                        backgroundImage:(NSString *)image
                                               andBlock:(ClickBlock)tempBlock;

@end
