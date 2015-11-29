//
//  ViewController.m
//  WCProject
//
//  Created by Yin Kokpheng on 11/27/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import "ViewController.h"
#import "PageItemController.h"

@interface ViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *contentImages;
@property (nonatomic, strong) NSArray *contentTitle;
@property (nonatomic, strong) NSArray *contentDescription;

@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation ViewController

#pragma mark -
#pragma mark View Lifecycle

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self createPageViewController];
    //[self setupPageControl];
}

- (void) createPageViewController
{
    
    _contentImages = @[@"collabo_introduction1.png",
                      @"collabo_introduction2.png",
                      @"collabo_introduction3.png"];
    
    _contentTitle = @[@"Collaboration",@"Easy & Simple",@"Different"];
    
    _contentDescription = @[@"업무 커뮤니케이션은 콜라보 하나면 끝",@"매뉴얼은 필요 없습니다. 카톡만큼 쉽습니다. 지금 바로 협업을 시작하세요.",@"사내 직원만 주고 받는 서비스와 비교하지 마세요. 사내/외 직원과 한 번에 협업이 가능합니다."];
    
    UIPageViewController *pageController = [self.storyboard instantiateViewControllerWithIdentifier: @"PageController"];
    pageController.dataSource = self;
    
    if([_contentImages count])
    {
        NSArray *startingViewControllers = @[[self itemControllerForIndex: 0]];
        [pageController setViewControllers: startingViewControllers
                                 direction: UIPageViewControllerNavigationDirectionForward
                                  animated: NO
                                completion: nil];
    }
    
    self.pageViewController = pageController;
    [self addChildViewController: self.pageViewController];
    [self.view addSubview: self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController: self];
}


#pragma mark -
#pragma mark UIPageViewControllerDataSource

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerBeforeViewController:(UIViewController *) viewController
{
    PageItemController *itemController = (PageItemController *) viewController;
    
    if (itemController.itemIndex > 0)
    {
        return [self itemControllerForIndex: itemController.itemIndex-1];
    }
    
    return nil;
}

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerAfterViewController:(UIViewController *) viewController
{
    PageItemController *itemController = (PageItemController *) viewController;
    
    if (itemController.itemIndex+1 < [_contentImages count])
    {
        return [self itemControllerForIndex: itemController.itemIndex+1];
    }
    
    return nil;
}

- (PageItemController *) itemControllerForIndex: (NSUInteger) itemIndex
{
    if (itemIndex < [_contentImages count])
    {
        PageItemController *pageItemController = [self.storyboard instantiateViewControllerWithIdentifier: @"ItemController"];
        pageItemController.itemIndex = itemIndex;
        pageItemController.imageName = _contentImages[itemIndex];
        pageItemController.titleName = _contentTitle[itemIndex];
        pageItemController.rollingImageName = itemIndex;
        pageItemController.descriptionName = _contentDescription[itemIndex];
        return pageItemController;
    }
    
    return nil;
}

//- (void) setupPageControl
//{
//    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
//    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
//    [[UIPageControl appearance] setBackgroundColor: [UIColor darkGrayColor]];
//}

//#pragma mark -
//#pragma mark Page Indicator
//
//- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
//{
//    return [_contentImages count];
//}
//
//- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
//{
//    return 0;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
