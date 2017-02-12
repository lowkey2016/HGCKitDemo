//
//  HGCRemakeLayoutLinker.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCRemakeLayoutLinker.h"
#import "HGCMasonryWrapper+Remake.h"

@interface HGCRemakeLayoutLinker ()

@end

@implementation HGCRemakeLayoutLinker


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    if (self) {
        [HGCMas removeAllConstraintsOfView:self.srcView];
    }
    return self;
}

@end
