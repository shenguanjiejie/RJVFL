//
//  ViewController.m
//  RJVFL
//
//  Created by shenruijie on 2018/12/29.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import "ViewController.h"
#import "UIView+RJVFL.h"
@interface ViewController ()

@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *yellowView1;
@property (nonatomic, strong) UIView *yellowView2;
@property (nonatomic, strong) UIView *yellowView3;
@property (nonatomic, strong) UIView *greenView1;
@property (nonatomic, strong) UIView *greenView2;
@property (nonatomic, strong) UIView *greenView3;
@property (nonatomic, strong) UIView *purpleView1;
@property (nonatomic, strong) UIView *purpleView2;
@property (nonatomic, strong) UIView *purpleView3;
@property (nonatomic, strong) UIView *purpleView4;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setViews];
    [self layout];
}

/**RJ 2018-12-30 15:23:59
 横竖屏
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        UIEdgeInsets inset = [UIApplication sharedApplication].keyWindow.safeAreaInsets;
        if (size.width > size.height) {
            self.view.topConstraint.constant = inset.top + 32;
        }else{
            self.view.topConstraint.constant = inset.top + 44;
        }
        self.view.leftConstraint.constant = inset.left;
        self.view.bottomConstraint.constant = -inset.bottom;
        self.view.rightConstraint.constant = -inset.right;
        [UIView animateWithDuration:0.1 animations:^{
            [self.view layoutIfNeeded];
        }];
    }];
}

#pragma mark - Private Methods

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setViews{
    
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.view addSubview:self.backgroundView];
    UIEdgeInsets inset = [UIApplication sharedApplication].keyWindow.safeAreaInsets;
    if (_index == 5) {
        [self.view addCenterXYConstraintToView:self.backgroundView constantX:0 constantY:0];
    }else{
        [self.view addAllAlignConstraintToView:self.backgroundView edgeInset:UIEdgeInsetsMake(inset.top+44, inset.left, inset.bottom, inset.right)];
    }
    
    /**RJ 2019-04-27 14:41:03 只是方便用来演示,现实开发中并不可取,请勿模仿*/
    self.redView = [self addSubviewWithBackgroundColor:[UIColor redColor]];
    self.blueView = [self addSubviewWithBackgroundColor:[UIColor blueColor]];
    self.yellowView1 = [self addSubviewWithBackgroundColor:[UIColor yellowColor]];
    self.yellowView2 = [self addSubviewWithBackgroundColor:[UIColor yellowColor]];
    self.yellowView3 = [self addSubviewWithBackgroundColor:[UIColor yellowColor]];
    self.greenView1 = [self addSubviewWithBackgroundColor:[UIColor greenColor]];
    self.greenView2 = [self addSubviewWithBackgroundColor:[UIColor greenColor]];
    self.greenView3 = [self addSubviewWithBackgroundColor:[UIColor greenColor]];
    self.purpleView1 = [self addSubviewWithBackgroundColor:[UIColor purpleColor]];
    self.purpleView2 = [self addSubviewWithBackgroundColor:[UIColor purpleColor]];
    self.purpleView3 = [self addSubviewWithBackgroundColor:[UIColor purpleColor]];
    self.purpleView4 = [self addSubviewWithBackgroundColor:[UIColor purpleColor]];
}

- (UIView *)addSubviewWithBackgroundColor:(UIColor *)color{
    UIView *view = [[UIView alloc] init];
    /**RJ 2018-12-29 20:01:04 为了看起来直观,添加一个透明度*/
    color = [color colorWithAlphaComponent:0.8];
    view.backgroundColor = color;
    [self.backgroundView addSubview:view];
    return view;
}

- (void)layout{
    switch (_index) {
        case 0:
            /**RJ 2018-12-29 19:29:01 _redView到self.backgroundView的四周边距都为10,该方法等价于下面四行代码*/
            [self.backgroundView addAllAlignConstraintToView:_redView constant:10];
            //            [self.backgroundView addTopAlignConstraintToView:_redView constant:10];
            //            [self.backgroundView addLeftAlignConstraintToView:_redView constant:10];
            //            [self.backgroundView addBottomAlignConstraintToView:_redView constant:10];
            //            [self.backgroundView addRightAlignConstraintToView:_redView constant:10];
            
            /**RJ 2018-12-29 19:30:32 _blueView到_redView的四周边距分别为0,10,100,20*/
            [_redView addAllAlignConstraintToView:_blueView edgeInset:UIEdgeInsetsMake(0, 10, 100, 20)];
            break;
        case 1:
            /**RJ 2018-12-29 19:34:37 _redView和_blueView的宽为100*/
            [UIView setWidthConstraintToViews:@[_redView,_blueView] constant:100];
            /**RJ 2018-12-29 20:05:00 这行代码等价于下方两行,_redView高100,_blueView高150*/
            [UIView setHeightConstraintToViews:@[_redView,_blueView] constants:@[@100,@150]];
            //            /**RJ 2018-12-29 20:03:02 _redView设置为正方形,即高度也为100,该方法调用不需要考虑顺序问题,完全可以先执行该方法*/
            //            [_redView setSquareConstraint];
            //            [_blueView addHeightConstraintWithConstant:150];
            
            /**RJ 2018-12-29 19:36:07 _redView到self.backgroundView的上方和左方为10*/
            [self.backgroundView addTopAlignConstraintToView:_redView constant:10];
            [self.backgroundView addLeftAlignConstraintToView:_redView constant:10];
            
            /**RJ 2018-12-29 19:37:32 _redView的底部距离_blueView为10,右边距离_blueView为20*/
            [_redView addBottomConstraintToView:_blueView constant:10];
            [_redView addRightConstraintToView:_blueView constant:20];
            break;
        case 2:
            /**RJ 2018-12-29 19:34:37 _redView和_blueView的宽为100,高为200*/
            [UIView setWidthConstraintToViews:@[_redView,_blueView] constant:150];
            [UIView setHeightConstraintToViews:@[_redView,_blueView] constant:200];
            
            /**RJ 2018-12-29 19:56:59 _redView在self.backgroundView的正中间*/
            [self.backgroundView addCenterXYConstraintToView:_redView constantX:0 constantY:0];
            /**RJ 2018-12-29 19:58:49 _blueView中心在_redView中心向下10的位置*/
            [_redView addCenterXYConstraintToView:_blueView constantX:0 constantY:10];
            break;
        case 3:
            /**RJ 2018-12-29 20:33:36 仅需两行代码,搞定一串view的所有简单布局*/
            
            /**RJ 2018-12-29 20:30:19
             从上到下,同时约束四个view和self.backgroundView,整个串距离全部为10.
             这里还用到了RJVFLOptions,RJVFLAlignAllHeight表示这四个view高度相同,不过其实实际开发中很少有这么整齐的约束,所以一般很少会用到RJVFLOptions
             */
            [self.backgroundView addBunchConstraintsToViews:@[
                                                    _redView,
                                                    _blueView,
                                                    _yellowView1,
                                                    _greenView1
                                                    ] constant:10 direction:RJDirectionTop options:RJVFLAlignAllHeight];
            
            /**RJ 2018-12-29 20:32:37 水平方向与self.backgroundView对齐*/
            [self.backgroundView addHAlignConstraintToViews:@[
                                                    _redView,
                                                    _blueView,
                                                    _yellowView1,
                                                    _greenView1
                                                    ] constant:0];
            break;
        case 4:
            /**RJ 2018-12-29 20:46:05 与case 3不同的是,这个串中的四个view高度间距都不相同,注意由于constants数组中只有四个constant
             依次为 self.backgroundView 10 _redView
             _redView 20 _blueView
             _blueView 30 _yellowView1
             _yellowView 40 _greenView1
             所以 greenView1和self.backgroundView的bottom之间没有构建约束,如果constants再多一个NSNumber对象,则会对两者进行约束
             假如将RJDirectionTop 改为 RJDirectionBottom,则上方的约束过程为从下往上依次数,最后是_redView 40 _blueView,self.backgroundView的top和_redView之间将没有约束,这也是该方法引入RJDirection参数的原因
             */
            [self.backgroundView addBunchConstraintsToViews:@[
                                                    _redView,
                                                    _blueView,
                                                    _yellowView1,
                                                    _greenView1
                                                    ] constants:@[@10,@20,@30,@40] direction:RJDirectionTop];
            /**RJ 2018-12-29 20:54:48 分别设置四个view的高度为40,50,100,40 数组中元素一一对应*/
            [UIView setHeightConstraintToViews:@[_redView,_blueView,_yellowView1,_greenView1] constants:@[@40,@50,@100,@40]];
            [self.backgroundView addHAlignConstraintToViews:@[
                                                    _redView,
                                                    _blueView,
                                                    _yellowView1,
                                                    _greenView1
                                                    ] constant:10];
            break;
        case 5:
        {
            NSArray *views = @[
                               @[_yellowView1,_yellowView2,_yellowView3],
                               @[_greenView1,_greenView2,_greenView3],
                               @[_purpleView1,_purpleView2,_purpleView3]
                               ];
            
            /**RJ 2019-04-27 14:49:44 九宫格的全部布局,简单的几行代码完成*/
            [self.backgroundView addCenterXYConstraintToView:_greenView2 constantX:0 constantY:0];
            [UIView setWidthConstraintToViews:views constant:80];
            [UIView setHeightConstraintToViews:views constant:80];
            [self.backgroundView addBunchConstraintsToViews:views constant:10 direction:RJDirectionTop];
            [self.backgroundView addBunchConstraintsToViews:@[
                                                 @[_yellowView1,_greenView1,_purpleView1],
                                                 @[_yellowView2,_greenView2,_purpleView2],
                                                 @[_yellowView3,_greenView3,_purpleView3],
                                                 ] constant:10 direction:RJDirectionLeft];
        }
            break;
        case 6:
            /**RJ 2018-12-29 20:57:21
             接下来是稍微复杂一点的约束,其实说是复杂,只是相对于上面的case而言,这些才是我们日常开发中常常遇到的约束场景
             */
            /**RJ 2018-12-30 13:23:26
             这十一个view的不规则layout,只用了四个方法搞定了.如果能熟练使用这两个串约束方法,能够很快速地实现复杂却更加直观的layout.
             如果使用其他layout框架,不知道这些布局需要写多少代码,这也是我坚持封装一个自己想要的layout框架的原因
             这里稍作说明:
             1.这两个串约束方法,能解决除了宽高外的大部分约束,第一个方法是RJDirectionTop,从上到下,把所有view的上下格局进行约束,第二个方法是RJDirectionLeft,从左到右,把所有view的左右格局进行约束.
             2.views及fatherView之间的间隙,和constants中的numbers互相对应,所以如果是要和fatherView的上下都要定义约束,那么constants.count == views.count+1
             3.数组中元素支持无限使用数组进行嵌套,之所以需要该功能的原因是,在这些views中,往往多个view和其中一个view之间是相同的constant,可以使用数组将这多个view装进去和这个view组成array和view一对一的关系.不在实际中应用该功能的话很难理解,请结合实际情况进行使用以便熟悉该功能.
             4.[NSNull null]是一个占位符,意味着该对应关系处不想添加约束,如果不使用NSNull进行占位,则会导致关系错乱.
             5.使用该方法的关键是自行判断如何对views进行分层,结合实际情况,慢慢习惯就好.有一个小技巧是,RJDirectionLeft方法写的时候,可以把设计图横过来看,就转变成了RJDirectionTop一样的逻辑.
             */
            [self.backgroundView addBunchConstraintsToViews:@[
                                                    _redView,
                                                    @[_yellowView1,@[_yellowView2,_yellowView3]],
                                                    @[_greenView1,_greenView2],
                                                    _blueView,
                                                    @[@[_purpleView1,_purpleView2],_purpleView3,_purpleView4]
                                                    ]
                                        constants:@[
                                                    @10,
                                                    @[@30,@[@10,@30]],
                                                    @[@10], //这里省略了后面的[NSNull null],当数组的后面部分全部为Null时,可以省略不写
                                                    @30,
                                                    @[@10,@40,@50],
                                                    @[[NSNull null],@20,@10],
                                                    ] direction:RJDirectionTop];
            
            [self.backgroundView addBunchConstraintsToViews:@[
                                                    @[_yellowView1,_greenView1,_blueView,_purpleView1],
                                                    @[_redView,@[_yellowView2,_greenView2],[NSNull null],_purpleView2],
                                                    _yellowView3,
                                                    _purpleView3,
                                                    _purpleView4
                                                    ]
                                        constants:@[
                                                    @[@10,@30,@10,@30],
                                                    @40,
                                                    @[@50],//这里省略了后面的两个[NSNull null],
                                                    [NSNull null],
                                                    @10,
                                                    @30,
                                                    ] direction:RJDirectionLeft];
            
            [UIView setWidthConstraintToViews:@[_redView,_yellowView1,_yellowView2,_yellowView3,_greenView1,_greenView2,_blueView,_purpleView1,_purpleView2,_purpleView3,_purpleView4] constants:@[@100,@80,@80,@60,@100,@100,@280,@60,@40,@80,@60]];
            [UIView setHeightConstraintToViews:@[_redView,_yellowView1,_yellowView2,_yellowView3,_greenView1,_greenView2,_blueView,_purpleView1,_purpleView2] constant:30];
            
            break;
        case 7:
            break;
            
        default:
            break;
    }
}

#pragma mark - Public Methods



@end
