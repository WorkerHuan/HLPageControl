//
//  HHPageScrollView.h
//  HHPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface HLPageScrollView : UIView
@property (nonatomic,strong) UIColor *itemNorColor;//默认grayColor
@property (nonatomic,strong) UIColor *itemSelectColor;//默认redColor
@property (nonatomic,assign) BOOL showLine;//默认不显示
@property (nonatomic,assign) CGFloat itemWidth;//默认title文字宽度
@property (nonatomic,assign) CGFloat itemSpace;//默认15
@property (nonatomic,assign) CGFloat itemsLeftSpace;//默认0
@property (nonatomic,assign) CGFloat itemsRightSpace;//默认0
@property (nonatomic,assign) CGFloat itemsHeight;//默认40
@property (nonatomic,assign) CGFloat itemTitleTextSize;//文字大小，默认15

@property (nonatomic , copy) NSArray<NSString *> *titleArray;
@property (nonatomic , copy) NSArray <UIViewController *>*pageControllArray;

- (void)reloadData;

@end
