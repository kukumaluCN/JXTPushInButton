//
//  JXTViewController.m
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


#import "JXTViewController.h"

#import "JXTPushInButton.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface JXTViewController ()

@end

@implementation JXTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     *  普通按钮
     */
    JXTPushInButton * btn = [JXTPushInButton touchUpOutsideCancelButtonWithType:UIButtonTypeCustom frame:CGRectMake(0, 0, ScreenWidth - 20, 80) title:@"按钮-1" titleColor:[UIColor blackColor] backgroundColor:[UIColor redColor] backgroundImage:nil andBlock:^{
        NSLog(@"frame内部松手执，行按钮-1");
    }];
    btn.buttonScale = 1.5;//这个设置其实无效，会自动判定的，超过0-1区间，还是默认值0.9
    btn.center = CGPointMake(self.view.frame.size.width/2., 80);
    [self.view addSubview:btn];
    
    JXTPushInButton * btn2 = [JXTPushInButton touchUpOutsideCancelButtonWithType:UIButtonTypeCustom frame:CGRectMake(10, CGRectGetMaxY(btn.frame) + 10, ScreenWidth - 30 - 150, 80) title:@"按钮-2" titleColor:[UIColor blackColor] backgroundColor:[UIColor greenColor] backgroundImage:nil andBlock:^{
        NSLog(@"frame内部松手执，执行按钮-2");
    }];
    [self.view addSubview:btn2];
    
    JXTPushInButton * btn3 = [JXTPushInButton touchUpOutsideCancelButtonWithType:UIButtonTypeCustom frame:CGRectMake(CGRectGetMaxX(btn2.frame) + 10, CGRectGetMaxY(btn.frame) + 10, 150, 80) title:@"按钮-3" titleColor:[UIColor blackColor] backgroundColor:[UIColor blueColor] backgroundImage:nil andBlock:^{
        NSLog(@"frame内部松手执，执行按钮-3");
    }];
    [self.view addSubview:btn3];
    
    
    /**
     *  图片背景按钮
     */
    CGFloat gap = 5;
    
    JXTPushInButton * imgBtn1 = [JXTPushInButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(gap, CGRectGetMaxY(btn2.frame) + 10, ScreenWidth - 2*gap, 80) title:nil titleColor:nil backgroundColor:nil backgroundImage:@"btn1" andBlock:^{
        NSLog(@"执行图片按钮-1");
    }];
    imgBtn1.adjustsImageWhenHighlighted = NO;//去除点击灰色
    [self.view addSubview:imgBtn1];
    
    NSArray * rectArray = @[[NSValue valueWithCGRect:CGRectMake(gap, CGRectGetMaxY(imgBtn1.frame) + gap, (ScreenWidth - 3*gap)/2, 60)],
                            [NSValue valueWithCGRect:CGRectMake(gap, CGRectGetMaxY(imgBtn1.frame) + 60+2*gap, (ScreenWidth - 5*gap)/4, 90)],
                            [NSValue valueWithCGRect:CGRectMake(2*gap + (ScreenWidth - 5*gap)/4, CGRectGetMaxY(imgBtn1.frame) + 60+2*gap, (ScreenWidth - 5*gap)/4, 90)],
                            [NSValue valueWithCGRect:CGRectMake(3*gap + 2*(ScreenWidth - 5*gap)/4, CGRectGetMaxY(imgBtn1.frame) + gap, (ScreenWidth - 4*gap)/2, 60)],
                            [NSValue valueWithCGRect:CGRectMake(3*gap + 2*(ScreenWidth - 5*gap)/4, CGRectGetMaxY(imgBtn1.frame) + 60+2*gap, (ScreenWidth - 5*gap)/4, 90)],
                            [NSValue valueWithCGRect:CGRectMake(4*gap + 3*(ScreenWidth - 5*gap)/4, CGRectGetMaxY(imgBtn1.frame) + 60+2*gap, (ScreenWidth - 5*gap)/4, 90)]
                            ];
    
    for (int i = 0; i < 6; i ++) {
        NSValue * value = rectArray[i];
        CGRect rect = value.CGRectValue;
        NSString * ima = [NSString stringWithFormat:@"btn%zd", i + 2 <= 4 ? i + 2 : i - 1];
        JXTPushInButton * imgBtn = [JXTPushInButton buttonWithType:UIButtonTypeCustom frame:rect title:nil titleColor:nil backgroundColor:nil backgroundImage:ima andBlock:^{
            NSLog(@"执行图片按钮-%zd", i + 2);
        }];
        imgBtn.buttonScale = 0.8;
        imgBtn.adjustsImageWhenHighlighted = NO;//去除点击灰色
        [self.view addSubview:imgBtn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
