//
//  LogoViewController.h
//  Ticket-ios
//
//  Created by Anson on 15/9/16.
//  Copyright (c) 2015年 LHW. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BaseViewController.h"
#import "UIColor+Hex.h"

#import "HWUtilityDefine.h"
#import "MBProgressHUD.h"
#import "JsonUtils.h"
#import "BaseHandler.h"
#import "Masonry.h"
#import "UmengClick.h"

@interface GuideViewController :UIViewController<UIScrollViewDelegate>
{
    UIScrollView *myScroll;
    UIPageControl *pageControl;
    UIButton *btn;
    
    NSArray *imageArray;
    
    CGFloat screenWidth;
    CGFloat screenHeight;

}



@end
