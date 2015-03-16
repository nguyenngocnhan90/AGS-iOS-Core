//
//  UIViewController+Custom.h
//  Alotro
//
//  Created by Nhan Nguyen on 8/13/14.
//  Copyright (c) 2014 Nhan Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AGS)

+ (UIViewController *)initBasicViewController;

- (void)popViewController;
- (void)pushViewController:(UIViewController *)viewController;
- (UIViewController *)topViewController;
- (void)popToViewControllerAtLastIndex:(NSInteger)index;

- (void)removeAllNavigationBarButtons;

@end
