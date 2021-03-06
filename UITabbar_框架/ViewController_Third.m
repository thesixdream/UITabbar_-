//
//  ViewController_Third.m
//  UITabBar框架
//
//  Created by 孟博 on 2017/9/19.
//  Copyright © 2017年 tgkj. All rights reserved.
//

#import "ViewController_Third.h"
#import "CustomNavigationView.h"
@interface ViewController_Third ()<CustomNavDelegate>
@property (nonatomic,strong) CustomNavigationView *NavigationView;

@end

@implementation ViewController_Third

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.NavigationView];
    // Do any additional setup after loading the view.
}
-(CustomNavigationView *)NavigationView{
    if (_NavigationView == nil) {
        _NavigationView = [[CustomNavigationView alloc]initWithNavColor:[UIColor purpleColor]];
        _NavigationView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        [_NavigationView setTitle:@"开播"];
        [_NavigationView setRightBtnTitle:@"跳转" withImage:nil];
        [_NavigationView setRightHidden:YES];
        [_NavigationView setBackHidden:YES];
        _NavigationView.delegate = self;
    }
    return _NavigationView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
