//
//  HLItemModel.h
//  HLPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HLItemModel : NSObject

@property (nonatomic,assign) CGFloat itemTitleTextSize;//文字大小，默认15
@property (nonatomic,copy,nonnull) NSString *title;
@property (nonatomic,copy) UIColor *itemNorColor;//默认grayColor
@property (nonatomic,copy) UIColor *itemSelectColor;//默认redColor
@property (nonatomic,assign) CGFloat itemWidth;//默认title文字宽度

@end

NS_ASSUME_NONNULL_END
