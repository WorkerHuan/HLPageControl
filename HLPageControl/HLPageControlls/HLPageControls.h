//
//  HHPageControls.h
//  HHPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@protocol HLPageScrollviewDelegate<NSObject>

@required
- (void)hl_pageDidScrollAtPage:(NSInteger)page;
@end

@interface HLPageControls : UIView
@property (nonatomic , copy) NSArray <UIViewController *>*pageControlls;
@property (nonatomic, assign) id<HLPageScrollviewDelegate> delegate;
@property (nonatomic , strong) UICollectionView *pageCollectionView;/**< */
- (void)scrollToDesPageWithIndexPath:(NSIndexPath *)indexPath;

@end
