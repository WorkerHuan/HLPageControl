//
//  HHPageScrollView.m
//  HHPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import "HLPageScrollView.h"
#import "HLItemView.h"
#import "HLPageControls.h"
@interface HLPageScrollView()<HLItemScrollviewDelegate,HLPageScrollviewDelegate>
@property (nonatomic , strong) HLItemView *itemView;/**< */
@property (nonatomic , strong) HLPageControls *pageView;/**< */
@property (nonatomic,strong) MASConstraint *itemViewLeft;
@property (nonatomic,strong) MASConstraint *itemViewRight;
@property (nonatomic,strong) MASConstraint *itemViewHeight;
@end

@implementation HLPageScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setHHScrollHeaderPage];
    }
    return self;
}

- (void)setHHScrollHeaderPage
{
    
    [self addSubview:self.itemView];
    
    [self.itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.itemViewLeft = make.left.mas_offset(0);
        self.itemViewRight = make.right.mas_offset(0);
        make.top.mas_offset(0);
        self.itemViewHeight = make.height.mas_offset(50);
    }];
    
    
    [self addSubview:self.pageView];
    
    [self.pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.bottom.mas_offset(0);
        make.top.equalTo(self.itemView.mas_bottom);
    }];
    
}

- (void)reloadData
{

    self.itemView.showLine = self.showLine;
    self.itemView.itemSpace = self.itemSpace;
    self.itemViewLeft.offset(self.itemsLeftSpace);
    self.itemViewRight.offset(-self.itemsRightSpace);
    self.itemViewHeight.offset(self.itemsHeight == 0?40:self.itemsHeight);
    
    NSMutableArray *titleModels = [[NSMutableArray alloc] initWithCapacity:self.titleArray.count];
    
    for (NSString *title in self.titleArray) {
        HLItemModel *titleModel = [[HLItemModel alloc] init];
        titleModel.itemNorColor = self.itemNorColor;
        titleModel.itemSelectColor = self.itemSelectColor;
        titleModel.title = title;
        titleModel.itemWidth = self.itemWidth;
        titleModel.itemTitleTextSize = self.itemTitleTextSize;
        
        [titleModels addObject:titleModel];
    }
    
    self.itemView.titleModels = [titleModels copy];
    self.pageView.pageControlls = self.pageControllArray;
    [self.itemView.itemCollectionView reloadData];
    [self.pageView.pageCollectionView reloadData];
}

- (void)hl_itemDidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.titleArray.count) {
        [self.pageView scrollToDesPageWithIndexPath:indexPath];
    }
    
}

- (void)hl_pageDidScrollAtPage:(NSInteger)page
{
    if (page < self.titleArray.count) {
        [self.itemView scrollCollectionItemToDesWithDesIndex:page];
    }
    
}

- (HLItemView *)itemView{
    if (!_itemView) {
        _itemView = [[HLItemView alloc] init];
        _itemView.delegate = self;
    }
    return _itemView;
}

- (HLPageControls *)pageView{
    if (!_pageView) {
        _pageView = [[HLPageControls alloc] init];
        _pageView.delegate = self;
    }
    return _pageView;
}

@end
