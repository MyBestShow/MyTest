//
//  WYCellTableViewCell.m
//  WYTest
//
//  Created by iOS on 2019/4/16.
//  Copyright © 2019年 iOS. All rights reserved.
//

#import "WYCellTableViewCell.h"
#import "UIButton+Utils.h"
@interface WYCellTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UIImageView *conImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *seeWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *zanWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentWIdth;
@property (weak, nonatomic) IBOutlet UIButton *seeBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

@end
@implementation WYCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImg.layer.cornerRadius = 22;
    self.headImg.layer.masksToBounds = YES;
    self.conImage.layer.cornerRadius = 10;
    self.conImage.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.shadowOffset = CGSizeMake(3, 3);
    self.bgView.layer.shadowOpacity = 0.3;
    self.bgView.layer.shadowColor =  [UIColor blackColor].CGColor;
    self.seeWidth.constant = self.frame.size.width / 3.0;
    self.zanWidth.constant = self.frame.size.width / 3.0;
    self.commentWIdth.constant = self.frame.size.width / 3.0;
    [self.seeBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:7];
    [self.zanBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:7];
    [self.commentBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:7];
}
- (void)showCellWithContent:(NSString *)content{
    self.contentLab.text = content;
}
- (void)showCellWithZanNum:(NSString *)string{
    if ([string isEqualToString:@"n"]) {
        [self.zanBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
    }else{
        [self.zanBtn setImage:[UIImage imageNamed:@"dianzan-1"] forState:UIControlStateNormal];
    }
}
- (IBAction)seeBtnClick:(id)sender {
    NSLog(@"看");
}
- (IBAction)zanBtnClick:(id)sender {
    NSLog(@"赞");
//    UIButton *btn = (UIButton *)sender;
//    if (btn.selected == YES) {
//        btn.selected = NO;
//        [btn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
//    }else{
//        btn.selected = YES;
//        [btn setImage:[UIImage imageNamed:@"dianzan-1"] forState:UIControlStateSelected];
//    }
    if (_zanBlock) {
        _zanBlock();
    }
}
- (IBAction)commentBtnClick:(id)sender {
    NSLog(@"评论");
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
