//
//  ViewController.m
//  HLPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import "ViewController.h"
#import "HLPageControlls/HLPageScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"热点",@"小说",@"体育",@"竞技",@"广西壮族自治区"];
    
    NSMutableArray *controls = [[NSMutableArray alloc] initWithCapacity:titles.count];
    for (int i = 0; i < titles.count; i ++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor colorWithRed:(arc4random()% 255)/255.0 green:(arc4random()% 255)/255.0 blue:(arc4random()% 255)/255.0 alpha:1];
        [controls addObject:vc];
    }
    
    HLPageScrollView *pageView = [[HLPageScrollView alloc] init];
    pageView.titleArray = titles;
    pageView.pageControllArray = controls;
    pageView.itemNorColor = [UIColor grayColor];
    pageView.itemSelectColor = [UIColor redColor];
    pageView.showLine = YES;
    [self.view addSubview:pageView];
    [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(80);
        make.left.right.mas_offset(0);
        make.bottom.mas_offset(-49);
    }];
    
    [pageView reloadData];
    
}


@end
