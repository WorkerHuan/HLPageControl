//
//  HHItemCell.h
//  HHPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface HLItemCell : UICollectionViewCell

@property (nonatomic,copy) NSString *cellTitle;
@property (nonatomic,strong) UIColor *color;
@property (nonatomic,assign) BOOL showLine;


@end
