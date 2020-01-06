//
//  HHItemCell.m
//  HHPageControl
//
//  Created by llbt on 2020/1/6.
//  Copyright © 2020 陈祖欢. All rights reserved.
//

#import "HLItemCell.h"
@interface HLItemCell()
@property (nonatomic,strong) UILabel *cellTitleLabel;
@property (nonatomic,strong) UIView *lineView;

@end
@implementation HLItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)setCellTitle:(NSString *)cellTitle{
    _cellTitle = cellTitle;
    self.cellTitleLabel.text = cellTitle?:@"";
}

- (void)setColor:(UIColor *)color{
    _color = color;
    self.cellTitleLabel.textColor = color;
    self.lineView.backgroundColor = color;
}

- (void)setShowLine:(BOOL)showLine{
    _showLine = showLine;
    self.lineView.hidden = !showLine;
}

- (void)createUI{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    self.cellTitleLabel = titleLabel;
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    UIView *lineView = [[UIView alloc] init];
    self.lineView = lineView;
    lineView.layer.cornerRadius = 1;
    
    
    [self.contentView addSubview:titleLabel];
    [self.contentView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_left);
        make.right.equalTo(titleLabel.mas_right);
        make.bottom.mas_offset(-2);
        make.height.mas_offset(2);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.left.mas_greaterThanOrEqualTo(0);
        make.right.mas_lessThanOrEqualTo(0);
        make.bottom.equalTo(lineView.mas_top).offset(-4);
    }];
    
}

@end
