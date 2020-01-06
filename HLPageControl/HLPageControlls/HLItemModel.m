//
//  HLItemModel.m
//  HLPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import "HLItemModel.h"
@interface HLItemModel()
@property (nonatomic,assign) BOOL hasItemWith;

@end
@implementation HLItemModel


- (void)setTitle:(NSString *)title{
    _title = title;

    if (!self.hasItemWith) {
        CGFloat textSize = _itemTitleTextSize == 0?15:_itemTitleTextSize;
        CGSize maxSize = CGSizeMake(MAXFLOAT, textSize);
        _itemWidth = [self sizeWithString:title font:[UIFont systemFontOfSize:textSize] maxSize:maxSize].width+2;
    }
}

- (void)setItemWidth:(CGFloat)itemWidth{
    if (itemWidth != 0) {
        _itemWidth = itemWidth;
        self.hasItemWith = YES;
    }
    
}

- (void)setItemTitleTextSize:(CGFloat)itemTitleTextSize{
    _itemTitleTextSize = itemTitleTextSize;
    
    if (self.title && !self.hasItemWith && itemTitleTextSize != 0) {
        CGFloat textSize = _itemTitleTextSize == 0?15:_itemTitleTextSize;
        CGSize maxSize = CGSizeMake(MAXFLOAT, textSize);
        _itemWidth = [self sizeWithString:_title font:[UIFont systemFontOfSize:textSize] maxSize:maxSize].width;
    }
}


- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}

@end
