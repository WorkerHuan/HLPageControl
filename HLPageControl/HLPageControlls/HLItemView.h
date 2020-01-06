//
//  HHItemView.h
//  HHPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "HLItemModel.h"
@protocol HLItemScrollviewDelegate<NSObject>

@required
- (void)hl_itemDidSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface HLItemView : UIView

@property (nonatomic , copy) NSArray<HLItemModel *> *titleModels;
@property (nonatomic, assign) id<HLItemScrollviewDelegate> delegate;

@property (nonatomic,assign) BOOL showLine;
@property (nonatomic,assign) CGFloat itemSpace;//默认15

@property (nonatomic , strong) UICollectionView *itemCollectionView;/**< */
- (void)scrollCollectionItemToDesWithDesIndex:(NSInteger)index;
@end
