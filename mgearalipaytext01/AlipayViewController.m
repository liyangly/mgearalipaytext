//
//  AlipayViewController.m
//  mgearalipaytext01
//
//  Created by 李阳 on 16/7/21.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "AlipayHeader.h"
#import "AlipayViewController.h"

@interface AlipayViewController ()
@property(nonatomic, strong) UIButton *payButton;
@end

@implementation AlipayViewController

#pragma mark - life cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"支付宝支付";
  self.view.backgroundColor = [UIColor whiteColor];
  // Do any additional setup after loading the view.
  [self initsubviews];
}

- (void)initsubviews {
  [self.view addSubview:self.payButton];
  self.payButton.frame =
      CGRectMake(10, 200, self.view.frame.size.width - 20, 44);
}

#pragma mark - private method
- (void)alipay:(UIButton *)sender {
  [AlipayRequestConfig alipayWithPartner:kPartnerID
                                  seller:kSellerAccount
                                 tradeNO:[AlipayToolKit genTradeNoWithTime]
                             productName:@"邮票"
                      productDescription:@"全真邮票"
                                  amount:@"0.8"
                               notifyURL:kNotifyURL
                                  itBPay:@"30m"];
}

#pragma mark - setter and getter
- (UIButton *)payButton {
  if (!_payButton) {
    _payButton = [[UIButton alloc] init];
    [_payButton setTitle:@"支付" forState:UIControlStateNormal];
    [_payButton setBackgroundColor:[UIColor cyanColor]];
    [_payButton addTarget:self
                   action:@selector(alipay:)
         forControlEvents:UIControlEventTouchUpInside];
  }
  return _payButton;
}

@end
