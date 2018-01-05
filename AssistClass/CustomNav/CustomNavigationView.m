//
//  CustomNavigationView.m
//  LiveCL
//
//  Created by chenyan on 15/12/21.
//  Copyright © 2015年 tiange. All rights reserved.
//

#import "CustomNavigationView.h"

#define kTitleFont 18
#define kBtnFont 17
#define kTopHeight 32

@interface CustomNavigationView()

@property (nonatomic,strong) UILabel* ptitle;
@property (nonatomic,strong) UIButton* pBackBtn;
@property (nonatomic,strong) UIButton* pRightBtn;
@property (nonatomic,strong) UIColor* navColor;
//@property (nonatomic, strong) UIImage *pBtnImg;  // 左侧返回配套图片
@end

@implementation CustomNavigationView

-(instancetype)initWithNavColor:(UIColor*)color
{
    self = [super init];
    if (self)
    {
        _navColor = color;
        [self initView];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _navColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}
-(void) initView
{
    self.frame = CGRectMake(0,0, SCREEN_WIDTH, 64);
    self.backgroundColor = _navColor;
    
    //返回按钮
    CGSize cSize  = [@"返回" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kBtnFont]}];
     UIImage* pBtnImg = [UIImage imageNamed:@"back"];
    _pBackBtn        = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                  20,
                                                                  pBtnImg.size.width + cSize.width + 15,
                                                                  pBtnImg.size.height +cSize.height)];
    [_pBackBtn addTarget:self action:@selector(CustomBackClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_pBackBtn setImage:pBtnImg forState:UIControlStateNormal];
    _pBackBtn.titleLabel.font = [UIFont systemFontOfSize: kBtnFont];
    [_pBackBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    self.pBackBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -13, 0);
    self.pBackBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, -13, 0);
    
    [_pBackBtn setTitle:@"返回" forState:UIControlStateNormal];
    [self addSubview:_pBackBtn];
    
    //标题栏
    _ptitle = [[UILabel alloc] init];
    _ptitle.textColor = [UIColor colorNamed:@"testColor"];
    _ptitle.font          = [UIFont fontWithName:@"Helvetica-Bold" size:kTitleFont];
    [self addSubview:_ptitle];
    
    //右边按钮
    _pRightBtn = [[UIButton alloc] init];
    [_pRightBtn addTarget:self action:@selector(CustomRightClick) forControlEvents:UIControlEventTouchUpInside];
    [_pRightBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    _pRightBtn.titleLabel.font = [UIFont systemFontOfSize: kBtnFont];
    _pRightBtn.titleEdgeInsets = UIEdgeInsetsMake(25, 0, 0, 0);
    [self addSubview:_pRightBtn];
}
-(void) CustomBackClick
{

    if ([self.delegate respondsToSelector:@selector(backClick)]) {
         [self.delegate backClick];
    }

}

-(void) CustomRightClick
{

    if ([_delegate respondsToSelector:@selector(rightClick)]) {
        [self.delegate rightClick];
    }
    

}

//设置返回按钮文字
-(void) setBackBtnTitle:(NSString*)strtitle withImage:(NSString*)strImg
{
    UIImage *pBtnImg;
    CGSize cSize  = [strtitle sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kBtnFont]}];
    
    UIEdgeInsets rect = UIEdgeInsetsMake(0, 0, 0, 5);
    
    if (!strImg) {
        pBtnImg = [UIImage imageNamed:@"back"];
//        self.pBackBtn.titleEdgeInsets = rect;
    }
    else{
        
        pBtnImg = [UIImage imageNamed:strImg];

        [_pBackBtn setImage:pBtnImg forState:UIControlStateNormal];
        _pBackBtn.frame     = CGRectMake(12,
                                          kTopHeight-5,
                                          pBtnImg.size.width + cSize.width + 5,
                                          pBtnImg.size.height);
        
        self.pBackBtn.imageEdgeInsets = rect;
    }
    
    if (strtitle != nil && strtitle.length > 0) {
     [_pBackBtn setTitle:strtitle forState:UIControlStateNormal];
    }
    else{
     [_pBackBtn setTitle:@"" forState:UIControlStateNormal];
    }
}

-(void)setRightHidden:(BOOL)bHidden{
    if (_pRightBtn) {
        _pRightBtn.hidden = bHidden;
    }
}

-(void) setBackHidden:(BOOL) bHidden
{
    if (_pBackBtn) {
        _pBackBtn.hidden = bHidden;
    }
}


- (void)setBackEnable:(BOOL)bEnable
{
    if (_pBackBtn) {
        _pBackBtn.userInteractionEnabled = NO;
        _pBackBtn.enabled = bEnable;
    }
    
}
//设置标题栏
-(void) setTitle:(NSString*)strtitle
{
    CGSize cSize  = [strtitle sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kTitleFont]}];
    _ptitle.frame = CGRectMake(SCREEN_WIDTH/2 - cSize.width/2,
                               kTopHeight,
                               cSize.width+20,
                               cSize.height);
    _ptitle.text  = strtitle;
}

//设置右边按钮文字
-(void) setRightBtnTitle:(NSString*)strtitle withImage:(NSString*)strImg
{
    UIImage *pBtnImg;
    CGSize cSize  = [strtitle sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kBtnFont]}];
    
    if (strImg == nil || strImg.length <= 0 )
    {
        _pRightBtn.frame     = CGRectMake(SCREEN_WIDTH - 15 - cSize.width,
                                          0,
                                          cSize.width + 15,
                                          64);
    }
    else
    {
        pBtnImg = [UIImage imageNamed:strImg];
        [_pRightBtn setImage:pBtnImg forState:UIControlStateNormal];
        _pRightBtn.frame     = CGRectMake(SCREEN_WIDTH -15 - pBtnImg.size.width - cSize.width,
                                          54/2-pBtnImg.size.height/2+10,
                                          pBtnImg.size.width + cSize.width + 10,
                                          pBtnImg.size.height);
    }
    [_pRightBtn setTitle:strtitle forState:UIControlStateNormal];
}
-(void) dealloc
{
    _ptitle = nil;
    _pBackBtn = nil;
    _pRightBtn = nil;
}
@end
