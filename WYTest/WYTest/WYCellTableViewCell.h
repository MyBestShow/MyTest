//
//  WYCellTableViewCell.h
//  WYTest
//
//  Created by iOS on 2019/4/16.
//  Copyright © 2019年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^zanClick)();

@interface WYCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (nonatomic, copy)zanClick zanBlock;
- (void)showCellWithContent:(NSString *)content;
- (void)showCellWithZanNum:(NSString *)string;
@end
