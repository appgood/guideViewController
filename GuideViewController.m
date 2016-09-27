//
//  LogoViewController.m
//  Ticket-ios
//
//  Created by Anson on 15/9/16.
//  Copyright (c) 2015年 LHW. All rights reserved.
//

#import "GuideViewController.h"
#import "LogoViewController.h"

@implementation GuideViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [UmengClick event:@"open_page" page:@"guide"];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    NSString *firstImage =  @"guidei6p-1.png";
    NSString *secondImage =  @"guidei6p-2.png";
    NSString *thirdImage = @"guidei6p-3.png";
    NSString *fourthImage = @"guidei6p-4.png";
    
    screenWidth = SCREENWIDTH;
    screenHeight = SCREENHEIGHT;
    
    if (iPhone4) {
        firstImage = @"guidei4-1.png";
        secondImage = @"guidei4-2.png";
        thirdImage = @"guidei4-3.png";
        fourthImage = @"guidei4-4.png";
    }
    if (iPhone5) {
        firstImage = @"guidei5-1.png";
        secondImage = @"guidei5-2.png";
        thirdImage = @"guidei5-3.png";
        fourthImage = @"guidei5-4.png";
    }
    if (iPhone6) {
        firstImage = @"guidei6-1.png";
        secondImage = @"guidei6-2.png";
        thirdImage = @"guidei6-3.png";
        fourthImage = @"guidei6-4.png";
    }
    if (iPhone6Plus) {
        firstImage = @"guidei6p-1.png";
        secondImage = @"guidei6p-2.png";
        thirdImage = @"guidei6p-3.png";
        fourthImage = @"guidei6p-4.png";
    }
    
    imageArray = @[firstImage,secondImage,thirdImage,fourthImage];

    __weak typeof(self)weakself = self;
    
    myScroll = [[UIScrollView alloc]init];
    [myScroll setBackgroundColor:[UIColor clearColor]];
    [myScroll setBounces:NO];
    [myScroll setShowsHorizontalScrollIndicator:NO];
    [myScroll setShowsVerticalScrollIndicator:NO];
    [myScroll setContentSize:CGSizeMake(screenWidth*[imageArray count], screenHeight)];
    [myScroll setPagingEnabled:YES];
    [myScroll setDelegate:self];
    [self.view addSubview:myScroll];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [myScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakself.view);
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    
    for (int i = 0;i<[imageArray count];i++) {
        UIImage *image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [imageView setFrame:CGRectMake(i*screenWidth, 0, screenWidth, self.view.bounds.size.height)];
        [myScroll addSubview:imageView];
        
        if (i == [imageArray count]-1) {
            [imageView setUserInteractionEnabled:YES];
            
            btn = [[UIButton alloc]initWithFrame:CGRectMake(27.5, 30.5, 320, 40)];
            [btn setBackgroundImage:[UIImage imageNamed:@"guideBtn.png"] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor clearColor]];
            [imageView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(263, 46));
                make.centerX.equalTo(imageView);
                make.bottom.mas_equalTo(-57);
            }];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    pageControl = [[UIPageControl alloc]init];
    [pageControl setBackgroundColor:[UIColor clearColor]];
    [pageControl setNumberOfPages:[imageArray count]];
    [pageControl setCurrentPage:0];
    
    [pageControl setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    [pageControl setPageIndicatorTintColor:[UIColor colorWithHexString:@"#675F6D"]];
    [pageControl addTarget:self action:@selector(switchPage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(myScroll);
        make.bottom.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(200, 20));
        
    }];
    
    
    
}

-(void)btnClick:(id)sender
{
    [UmengClick event:@"goto_login" page:@"guide"];
    
    LogoViewController *logo = [[LogoViewController alloc]init];
    logo.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:logo animated:YES];
//    BaseNavigationController *navLogo = [[BaseNavigationController alloc]initWithRootViewController:logo];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x/self.view.bounds.size.width;
    [pageControl setCurrentPage:currentPage];
    
}

-(void)switchPage:(id)sender
{
    UIPageControl *currentControl = (UIPageControl*)sender;
    NSInteger currentPage = currentControl.currentPage;
    [myScroll setContentOffset:CGPointMake(currentPage*screenWidth, 0) animated:YES];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UmengClick beginLogPageView:@"Logo Page"];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UmengClick endLogPageView:@"Logo Page"];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
