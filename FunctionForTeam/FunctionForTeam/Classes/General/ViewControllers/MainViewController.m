//
//  MainViewController.m
//  FunctionForTeam
//
//  Created by 王伯南 on 15/11/9.
//  Copyright © 2015年 王伯南. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<BROptionButtonDelegate>

@property (nonatomic, strong) BROptionsButton *brOptionsButton;

@property (nonatomic, strong) MiddleViewController *middleVC;

@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"header"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(presentLeftMenuViewController:)];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UINavigationController *homePageNC = [[UINavigationController alloc] initWithRootViewController:[HomePageController new]];
    
    _middleVC = [MiddleViewController new];
    UINavigationController *middleNC = [[UINavigationController alloc] initWithRootViewController:_middleVC];
    middleNC.navigationBar.translucent = NO;
    
    UINavigationController *gameNC = [[UINavigationController alloc] initWithRootViewController:[GameController new]];

    self.viewControllers = @[homePageNC,middleNC,gameNC];

    BROptionsButton *brOption = [[BROptionsButton alloc] initWithTabBar:self.tabBar forItemIndex:1 delegate:self];
    self.brOptionsButton = brOption;
    [brOption setImage:[UIImage imageNamed:@"Apple"] forBROptionsButtonState:BROptionsButtonStateNormal];
    [brOption setImage:[UIImage imageNamed:@"close"] forBROptionsButtonState:BROptionsButtonStateOpened];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BROptionsButtonState

- (NSInteger)brOptionsButtonNumberOfItems:(BROptionsButton *)brOptionsButton {
    return 3;
}

- (UIImage*)brOptionsButton:(BROptionsButton *)brOptionsButton imageForItemAtIndex:(NSInteger)index {

    if (index == 0) {
        
        return [UIImage imageNamed:@"happy"];
        
    }else if (index == 1){
     
        return [UIImage imageNamed:@"read"];
    }
    
    return [UIImage imageNamed:@"music"];
}


- (void)brOptionsButton:(BROptionsButton *)brOptionsButton didSelectItem:(BROptionItem *)item {
    [self setSelectedIndex:brOptionsButton.locationIndexInTabBar];
    
    [_middleVC pageWithIndex:item.index];
}


@end
