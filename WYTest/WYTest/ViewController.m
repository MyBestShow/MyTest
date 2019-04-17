//
//  ViewController.m
//  WYTest
//
//  Created by iOS on 2019/4/16.
//  Copyright © 2019年 iOS. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Utils.h"
#import "UILabel+Suitable.h"
#import "WYCellTableViewCell.h"
//texttext
// textDino
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *sourceArray;
@property (nonatomic, strong)NSMutableArray *zanArray;
@property (nonatomic, strong)UIView *headView;
@end

@implementation ViewController
-(NSMutableArray *)sourceArray{
    if (!_sourceArray) {
        _sourceArray = [NSMutableArray arrayWithObject:0];
        
    }
    return _sourceArray;
}
-(NSMutableArray *)zanArray{
    if (!_zanArray) {
        _zanArray = [NSMutableArray arrayWithObject:0];
    }
    return _zanArray;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    //[self preferredStatusBarStyle];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //[self setStatuBarBackgroundColor:[UIColor colorWithHexString:@"f9581f"]];
    [self setStatuBarBackgroundColor:[UIColor colorWithRed:23/255.0 green:160/255.0 blue:247/255.0 alpha:1.0]];
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    [self setStatuBarBackgroundColor:[UIColor clearColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
// 设置状态栏颜色
- (void)setStatuBarBackgroundColor:(UIColor *)color{
    UIView *statusBar = [[[UIApplication sharedApplication]valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent; // 白色
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}
- (void)layoutUI{
    self.navigationController.navigationBarHidden = YES;
    self.headView  = [[UIView alloc]initWithFrame:CGRectMake(0, kStatusBarHeight, SCREEN_WIDTH , 183)];
    self.headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headView];
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 148)];
    blueView.backgroundColor = [UIColor colorWithRed:23/255.0 green:160/255.0 blue:247/255.0 alpha:1.0];
    [self.headView addSubview:blueView];
    
    NSArray *titleBtnArr = @[@"功能",@"消息"];
    for (int i = 0; i<titleBtnArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(SCREEN_WIDTH/2 - 70+i*70, 22, 70, 20);
        button.tag = 100+i;
        [button setTitle:titleBtnArr[i] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor colorWithRed:148/255.0 green:213/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [blueView addSubview:button];
        if (i == 0) {
            button.selected = YES;
        }
    }
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(15, 85, SCREEN_WIDTH - 30, 90)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.shadowColor =  [UIColor blackColor].CGColor;
    contentView.layer.shadowOpacity = 0.8f;
    contentView.layer.shadowRadius = 3.0f;
    contentView.layer.shadowOffset = CGSizeMake(3, 3);
    contentView.layer.cornerRadius = 5;
    contentView.layer.masksToBounds = YES;
    
    [self.headView addSubview:contentView];
    
    NSArray *titBtnArr = @[@"游戏日志",@"爱情日志",@"一键约战"];
    NSArray *imageBtnArr = @[@"youxi-3",@"aiqingrizhi",@"yuehzan"];
    for (int i = 0; i<titBtnArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(SCREEN_WIDTH - 30)/3, 0, (SCREEN_WIDTH - 30)/3, 90);
        button.tag = 200+i;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitle:titBtnArr[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageBtnArr[i]] forState:UIControlStateNormal];
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:12];
        [button addTarget:self action:@selector(contentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:button];
    }
    self.sourceArray = [NSMutableArray arrayWithObjects:@"“我们将重建(巴黎)圣母院”。法国总统马克龙表示，“最糟糕的情况已经避免了”，这要归功于消防员的努力。",@"据新华社报道，记者从中国银保监会获悉，对于近日媒体热议奔驰女车主被收取“金融服务费”问题，中国银保监会高度重视，已要求北京银保监局对梅赛德斯-奔驰汽车金融有限公司是否存在通过经销商违规收取金融服务费等问题开展调查。银保监会表示，将根据调查情况依法采取必要的监管措施，切实维护金融消费者的合法权益。",@"但是有一个城市，2万元就能实现你的“安居梦”。",@"高考命题减少单纯死记硬背的知识性考察，探索在高校组织的考核中增设体育测试 …… 近日，教育部印发《关于做好 2019 年普通高校招生工作的通知》，对今年普通高校招生工作进行全面部署，提出要确保高校考试招生工作公平公正、规范有序。",@"《通知》明确了今年考试时间：6 月 7 日 9:00 至 11:30 语文；15:00 至 17:00 数学。6 月 8 日 9:00 至 11:30 文科综合 / 理科综合；15:00 至 17:00 外语，有外语听力测试内容的应安排在外语笔试考试开始前进行。各省 ( 区、市 ) 考试科目名称与全国统考科目名称相同的必须与全国统考时间安排一致。具体考试科目时间安排报教育部考试中心备案后发布。省级统考和高校的招生考试时间，分别由各省级招委会和高校按照教育部有关要求确定并发布。", nil];
    self.zanArray = [NSMutableArray arrayWithObjects:@"n",@"n",@"n",@"n",@"n", nil];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame), SCREEN_WIDTH, SCREEN_HEIGHT - 49 -183) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"WYCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"WYCellTableViewCell"];
    
    [self.view addSubview:self.tableView];
    
}
- (void)clickButton:(UIButton *)sender{
    sender.selected = YES;
    
    if (sender.tag == 100) {
        NSLog(@"功能");
        UIButton *btn = (UIButton *)[self.headView viewWithTag:101];
        btn.selected = NO;
    }else if (sender.tag == 101){
        NSLog(@"消息");
        UIButton *btn = (UIButton *)[self.headView viewWithTag:100];
        btn.selected = NO;
    }
}
- (void)contentBtnClick:(UIButton *)sender{
    if (sender.tag == 200) {
        NSLog(@"游戏日志");
    }else if (sender.tag == 201){
        NSLog(@"爱情日志");
    }else{
        NSLog(@"一键约战");
    }
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WYCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WYCellTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *conStr = self.sourceArray[indexPath.row];
    [cell showCellWithContent:conStr];
    [cell showCellWithZanNum:self.zanArray[indexPath.row]];
    __block WYCellTableViewCell *bCell = cell;
    cell.zanBlock = ^{
        NSString *str = self.zanArray[indexPath.row];
        if ([str isEqualToString:@"n"]) {
            [self.zanArray replaceObjectAtIndex:indexPath.row withObject:@"y"];
            [bCell.zanBtn setImage:[UIImage imageNamed:@"dianzan-1"] forState:UIControlStateNormal];
        }else{
            [self.zanArray replaceObjectAtIndex:indexPath.row withObject:@"n"];
            [bCell.zanBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
        }
    };
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float labelHeight = 0.0;
    labelHeight = [UILabel getHeightByWidth:SCREEN_WIDTH -75 title:self.sourceArray[indexPath.row] font:[UIFont systemFontOfSize:14]];
    return labelHeight + 270;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
