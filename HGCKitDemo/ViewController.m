//
//  ViewController.m
//  HGCKitDemo
//
//  Created by Jymn_Chen on 2017/2/12.
//  Copyright © 2017年 com.jymnchen. All rights reserved.
//

#import "ViewController.h"
#import "HGCKit.h"

@interface ViewController ()

@property (nonatomic, strong) HGCLabel *label;
@property (nonatomic, strong) HGCButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [HGCLabel rightAlignRegularLabelWithText:@"???" textColor:[UIColor blackColor] fontSize:20];
    [self.view addSubview:_label];
    _label.hgc_make.centerAlignToSuperView();
    
    self.button = [HGCButton buttonWithTitle:@"Click me" fontSize:15 fontType:HGCFontTypeRegular];
    [_button setNormalTitleColor:[UIColor whiteColor] highlightedTitleColor:[UIColor grayColor]];
    [_button setNormalBackgroundImageWithColor:[UIColor purpleColor] highlightedBackgroundImageWithColor:[UIColor yellowColor]];
    [_button hgc_addBorderWithRadius:22 color:[UIColor greenColor] width:1.0];
    [self.view addSubview:_button];
    [_button addTarget:self action:@selector(btnAction:)];
    _button.hgc_make.centerXAlignTo(_label).topSpacingToBottomOf(_label, 20).widthIs(100).heightIs(44);
}

- (void)btnAction:(id)sender {
    _label.text = @"Hello, HGCKit";
}

@end
