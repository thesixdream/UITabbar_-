//
//  ViewController_First.m
//  UITabBar框架
//
//  Created by 孟博 on 2017/9/19.
//  Copyright © 2017年 tgkj. All rights reserved.
//

#import "ViewController_First.h"
#import "CustomNavigationView.h"
@interface ViewController_First ()<CustomNavDelegate>
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) CustomNavigationView *NavigationView;
@property (nonatomic,strong) UIView *BaseView;
@end

@implementation ViewController_First

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
//    self.navigationItem.title = @"直播";
//    [self.view addSubview:self.BaseView];
    [self.view addSubview:self.NavigationView];
    _leftBtn = [[UIButton alloc] init];
//    [_leftBtn setImage:image forState:UIControlStateNormal];
    _leftBtn.backgroundColor = [UIColor cyanColor];
    _leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    _leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_leftBtn addTarget:self action:@selector(leftBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    // Do any additional setup after loading the view.
}

-(CustomNavigationView *)NavigationView{
    if (_NavigationView == nil) {
        _NavigationView = [[CustomNavigationView alloc]initWithNavColor:[UIColor blueColor]];
        _NavigationView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        [_NavigationView setTitle:@"直播"];
        [_NavigationView setRightBtnTitle:@"跳转" withImage:nil];
        _NavigationView.delegate = self;
    }
    return _NavigationView;
}

-(UIView *)BaseView{
    if (_BaseView == nil) {
        _BaseView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _BaseView.backgroundColor = [UIColor purpleColor];
    }
    return _BaseView;
    
}

-(void)rightClick{
    
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
