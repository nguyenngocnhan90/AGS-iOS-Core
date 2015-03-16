//
//  UIViewController+Custom.m
//  Alotro
//
//  Created by Nhan Nguyen on 8/13/14.
//  Copyright (c) 2014 Nhan Nguyen. All rights reserved.
//

#import "UIViewController+AGS.h"

@implementation UIViewController (AGS)

+ (UIViewController *)initBasicViewController
{
    Class class = [self class];
    UIViewController *viewController = [[self alloc] initWithNibName:NSStringFromClass(class) bundle:nil];

    return viewController;
}

#pragma mark - Push and Pop View Controller

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController
{
    [self.navigationController pushViewController:viewController animated:YES];
}

- (UIViewController *)topViewController
{
    return self.navigationController.topViewController;
}

- (void)popToViewControllerAtLastIndex:(NSInteger)index
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *viewController = viewControllers[viewControllers.count - index];
    
    [self.navigationController popToViewController:viewController animated:YES];
}

- (void)removeAllNavigationBarButtons
{
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
}

@end
