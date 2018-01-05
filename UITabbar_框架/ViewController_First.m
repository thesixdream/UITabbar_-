//
//  ViewController_First.m
//  UITabBar框架
//
//  Created by 孟博 on 2017/9/19.
//  Copyright © 2017年 tgkj. All rights reserved.
//

#import "ViewController_First.h"
#import "CustomNavigationView.h"
@interface ViewController_First ()<CustomNavDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong) CustomNavigationView *NavigationView;
@property (nonatomic,strong) UIView *BaseView;
@property (nonatomic,strong) UITableView *BaseTableView;
@property (nonatomic,strong) UIView *headerBackView;
@property (nonatomic,strong) UIImageView *headerImageView;
@end

@implementation ViewController_First

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"testColor"];
    self.navigationItem.title = @"直播";
    [self.view addSubview:self.NavigationView];
    [self.view addSubview:self.BaseTableView];
    [self addHeaderImageView];
    
    
    // Do any additional setup after loading the view.
}
//添加头像
-(void)addHeaderImageView{
    [self.BaseTableView setTableHeaderView:self.headerBackView];
    [self.headerImageView setFrame:self.headerBackView.bounds];
    [self.headerBackView addSubview:self.headerImageView];
}
-(CustomNavigationView *)NavigationView{
    if (_NavigationView == nil) {
        _NavigationView = [[CustomNavigationView alloc]initWithNavColor:[UIColor colorNamed:@"grayColor"]];
        _NavigationView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        [_NavigationView setTitle:@"直播"];
        [_NavigationView setRightHidden:YES];
        [_NavigationView setBackHidden:YES];
        [_NavigationView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [_NavigationView setRightBtnTitle:@"跳转" withImage:nil];
        _NavigationView.delegate = self;
    }
    return _NavigationView;
}

-(UITableView *)BaseTableView{
    if (!_BaseTableView) {
        _BaseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];
        _BaseTableView.delegate = self;
        _BaseTableView.dataSource = self;
        [_BaseTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return _BaseTableView;
}
#pragma mark - 懒加载
-(UIView *)headerBackView{
    if (_headerBackView == nil) {
        _headerBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        [_headerBackView setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _headerBackView;
}
-(UIImageView *)headerImageView{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc] init];
        [_headerImageView setImage:[UIImage imageNamed:@"3cun 0997.JPG"]];
        [_headerImageView setBackgroundColor:[UIColor greenColor]];
        [_headerImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_headerImageView setClipsToBounds:YES];
    }
    return _headerImageView;
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
#pragma mark -- tablevie代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentyfyID = @"indentyfyID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentyfyID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentyfyID];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.contentView.backgroundColor = [UIColor colorNamed:@"grayColor"];
    cell.textLabel.text = @"美女";
    [cell.imageView setImage:[UIImage imageNamed:@"3cun 0997.JPG"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //图片高度
    CGFloat imageHeight = self.headerBackView.frame.size.height;
    //图片宽度
    CGFloat imageWidth = SCREEN_WIDTH;
    //图片上下偏移量
    CGFloat imageOffsetY = scrollView.contentOffset.y;
    
    NSLog(@"图片上下偏移量 imageOffsetY:%f ->",imageOffsetY);
    //上移
    if (imageOffsetY < 0) {
        CGFloat totalOffset = imageHeight + ABS(imageOffsetY);
        CGFloat f = totalOffset / imageHeight;
        
        self.headerImageView.frame = CGRectMake(-(imageWidth * f - imageWidth) * 0.5, imageOffsetY, imageWidth * f, totalOffset);
    }
    
    //        //下移
    //        if (imageOffsetY > 0) {
    //            CGFloat totalOffset = imageHeight - ABS(imageOffsetY);
    //            CGFloat f = totalOffset / imageHeight;
    //
    //            [self.headerImageView setFrame:CGRectMake(-(imageWidth * f - imageWidth) * 0.5, imageOffsetY, imageWidth * f, totalOffset)];
    //        }
    //scrollView已经有拖拽手势，直接拿到scrollView的拖拽手势
    /*
    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
    //获取到拖拽的速度 >0 向下拖动 <0 向上拖动
    CGFloat velocity = [pan velocityInView:scrollView].y;
    
    if (velocity <- 5) {
        //向上拖动，隐藏导航栏
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else if (velocity > 5) {
        //向下拖动，显示导航栏
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else if(velocity == 0){
        //停止拖拽
    }
     */
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change  context:(void *)context{
    
}

@end
