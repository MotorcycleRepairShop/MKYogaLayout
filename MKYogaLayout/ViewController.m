//
//  ViewController.m
//  MKYogaLayout
//
//  Created by Milker on 2018/5/25.
//  Copyright © 2018年 Milker. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MKYoga.h"
#import "MKScreen.h"
#import "MPSimpleLayoutViewController.h"
#import "MPDataBindViewController.h"
#import "MPStyleViewController.h"
#import "MPLabelViewController.h"
#import "MPTextInputViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UILabel *nickname;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavbar];

    NSDictionary *style = @{
            @"item": @{
                    kLBg: @"#eeeeee",
                    kLBg_Highlight: @"#999999",
                    kLPaddingVertical: @30,
                    kLAlignItems: @(YGAlignCenter),
                    kLTextAlignment: @(NSTextAlignmentCenter),
            }
    };

    NSDictionary *layout = @{
            kLPaddingTop: @(MKScreen.safeTop),
            kLBg: @"#FFFFFF",
            kLSubviews:
            @[
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"item",
                            kLNavigation:
                            @{ /// 这里使用了导航器的配置
                                    kLNavigationPage: MPSimpleLayoutViewController.class,
                            },
                            kLText: @"简单布局"
                    },
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"item",
                            kLBindTap: @"gotoBindDataDemo",
                            kLText: @"数据绑定"
                    },
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"item",
                            kLBindTap: @"gotoStyleDemo",
                            kLText: @"样式表"
                    },
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"item",
                            kLText: @"文本",
                            kLNavigation:
                            @{
                                    kLNavigationPage: MPLabelViewController.class,
                            },
                    },
                    @{
                            kLView: UILabel.class,
                            kLStyle: @"item",
                            kLText: @"输入框",
                            kLNavigation:
                            @{
                                    kLNavigationPage: MPTextInputViewController.class,
                            },
                    }
            ]
    };

    [UIView createSubViewsByLayout:layout rootView:self.view context:self style:style data:nil];
}

- (void)initNavbar {
    [self setTitle:@"MKYogaLayout"];
}

#pragma mark - events

- (void)gotoSimpleLayout:(id)sender {
    MPSimpleLayoutViewController *vc = [MPSimpleLayoutViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoBindDataDemo:(id)sender {
    MPDataBindViewController *vc = [MPDataBindViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoStyleDemo:(id)sender {
    MPStyleViewController *vc = [MPStyleViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
