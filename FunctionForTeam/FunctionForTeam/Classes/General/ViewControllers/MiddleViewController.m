//
//  MiddleViewController.m
//  FunctionForTeam
//
//  Created by 王伯南 on 15/11/9.
//  Copyright © 2015年 王伯南. All rights reserved.
//

#import "MiddleViewController.h"

@interface MiddleViewController ()

@property (nonatomic,strong) UIScrollView *pageScrollView;

@end

@implementation MiddleViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setUpView];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"header"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(presentLeftMenuViewController:)];
        
    }
    return self;
}

-(void)setUpView{
    
    _pageScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    _pageScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0);
    
    _pageScrollView.pagingEnabled = YES;
    _pageScrollView.scrollEnabled = NO;
    _pageScrollView.showsVerticalScrollIndicator = FALSE;
    _pageScrollView.showsHorizontalScrollIndicator = FALSE;
    
    _pageScrollView.bounces = NO;
    
    [self.view addSubview:_pageScrollView];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self addAllViews];

}

-(void)addAllViews{
    
    UIView *musicView = [MusicPlayerController new].view;
    musicView.frame = CGRectMake(0, 0, musicView.frame.size.width, musicView.frame.size.height);
    [_pageScrollView addSubview:musicView];
    
    UITableView *readTableView = (UITableView *)[ReadingController new].view;
    readTableView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, readTableView.frame.size.width, readTableView.frame.size.height);
    [_pageScrollView addSubview:readTableView];
    
    
    UITableView *jokeTableView = (UITableView *)[JokeController new].view;
    jokeTableView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, jokeTableView.frame.size.width, jokeTableView.frame.size.height);
    [_pageScrollView addSubview:jokeTableView];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pageWithIndex:(NSInteger)index{
    
    _pageScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * index, 0);
    
    if (index == 0) {
        
        self.title = @"段子";
        
    }else if(index == 1){
        
        self.title = @"阅读";
        
    }else{
        
        self.title = @"音乐";
        
    }
    
}

@end
