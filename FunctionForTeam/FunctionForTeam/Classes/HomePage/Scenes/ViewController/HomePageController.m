//
//  HomePageController.m
//  FunctionForTeam
//
//  Created by 王伯南 on 15/11/9.
//  Copyright © 2015年 王伯南. All rights reserved.
//

#import "HomePageController.h"

@interface HomePageController ()

@end

@implementation HomePageController

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.title = @"首页";
        
        self.tabBarItem.title = @"首页";
        
        self.tabBarItem.image = [UIImage imageNamed:@"record"];
        
        self.view.backgroundColor = [UIColor redColor];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
