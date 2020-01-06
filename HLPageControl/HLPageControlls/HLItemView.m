//
//  HHItemView.m
//  HHPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import "HLItemView.h"
#import "HLItemCell.h"
typedef void(^sendblock)(int index);
@interface HLItemView()<UICollectionViewDelegate,UICollectionViewDataSource>


/**记录当前选择的 indexpath**/
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end


@implementation HLItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = LLBlueColor;
        [self setCollectionView];
    }
    return self;
}

- (void)setCollectionView
{
    
    NSIndexPath *desIndexpath = [NSIndexPath indexPathForRow:0 inSection:0];
    self.currentIndexPath = desIndexpath;
    
    [self addSubview:self.itemCollectionView];
    [self.itemCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
}


#pragma mark -- 处理滑屏事件
- (void)scrollCollectionItemToDesWithDesIndex:(NSInteger)index{
    
    NSIndexPath *desIndexpath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.itemCollectionView  scrollToItemAtIndexPath:desIndexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.currentIndexPath = desIndexpath;
    [self.itemCollectionView reloadData];
    
}
#pragma mark collectionView代理方法

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleModels.count;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HLItemModel *itemModel = self.titleModels[indexPath.row];
    
    return CGSizeMake(itemModel.itemWidth, self.frame.size.height);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellID = @"HLItemCell";
    HLItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    HLItemModel *itemModel = self.titleModels[indexPath.row];
    cell.cellTitle = itemModel.title;
    if (indexPath == self.currentIndexPath) {
        cell.showLine = self.showLine;
        cell.color = itemModel.itemSelectColor?:[UIColor redColor];
    }else
    {
        cell.showLine = NO;
        cell.color = itemModel.itemNorColor?:[UIColor grayColor];
    }
    
    
    return cell;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentIndexPath = indexPath;
    [collectionView reloadData];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(hl_itemDidSelectRowAtIndexPath:)]) {
        [self.delegate hl_itemDidSelectRowAtIndexPath:indexPath];
    }
}

- (UICollectionView *)itemCollectionView{
    if (!_itemCollectionView) {
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置collectionView滚动方向
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = self.itemSpace==0?15:self.itemSpace;
        //2.初始化collectionView
        _itemCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        
        _itemCollectionView.backgroundColor = [UIColor clearColor];
        _itemCollectionView.showsHorizontalScrollIndicator = NO;
        //    //3.注册collectionViewCell
        [_itemCollectionView registerClass:[HLItemCell class] forCellWithReuseIdentifier:NSStringFromClass([HLItemCell class])];
        
        //4.设置代理
        _itemCollectionView.delegate = self;
        _itemCollectionView.dataSource = self;
        if(@available(iOS 11.0, *)) {
            _itemCollectionView.contentInsetAdjustmentBehavior =UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
        }
    }
    return _itemCollectionView;
}

@end
