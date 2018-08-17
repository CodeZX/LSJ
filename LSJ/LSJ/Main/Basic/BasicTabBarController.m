//
//  BasicTabBarController.m
//  LSJ
//
//  Created by 周鑫 on 2018/8/17.
//  Copyright © 2018年 ZX. All rights reserved.
//

#import "BasicTabBarController.h"
#import "BasicNavigationController.h"
#import "GramophoneViewControllerTwo.h"
#import "RecordViewController.h"
#import "PasswordBoxViewController.h"

@interface BasicTabBarController ()

@end

@implementation BasicTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self addChildViewControllers];
}

- (void)addChildViewControllers
{
    
   
    
    GramophoneViewControllerTwo *gramophoneVC =  [[GramophoneViewControllerTwo alloc]init];
    [self setChildViewController:gramophoneVC Image:@"icon_phonograph_nor" selectedImage:@"icon_phonograph_pre" title:@""];
    RecordViewController *RecordVC = [[RecordViewController alloc] init];
    [self setChildViewController:RecordVC Image:@"icon_add" selectedImage:@"icon_add" title:@""];
    //    UserCenterViewController *UserCenterVC = [[UserCenterViewController alloc] init];
    //    [self setChildViewController:UserCenterVC Image:@"icon_my_nor" selectedImage:@"icon_my" title:@""];
    PasswordBoxViewController *passwordBoxVC = [[PasswordBoxViewController alloc]init];
    [self setChildViewController:passwordBoxVC Image:@"lock_nor" selectedImage:@"lock_pre" title:@""];
}

#pragma mark - 初始化设置ChildViewControllers
/**
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setChildViewController:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    BasicNavigationController *NA_VC = [[BasicNavigationController alloc] initWithRootViewController:Vc];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.title = title;
    
    [self addChildViewController:NA_VC];
    
}




@end
