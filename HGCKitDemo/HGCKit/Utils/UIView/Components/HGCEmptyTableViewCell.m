//
//  HGCEmptyTableViewCell.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/9/2.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCEmptyTableViewCell.h"

@interface HGCEmptyTableViewCell ()

@end

@implementation HGCEmptyTableViewCell


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Override Methods

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)prepareForReuse {
    [super prepareForReuse];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Cell Config Methods

+ (NSString *)cellID {
    return @"HGCEmptyTableViewCellID";
}

+ (CGFloat)cellHeight {
    return 0;
}

@end
