//
//  ViewController.m
//  weixinpay
//
//  Created by 黄科源 on 2018/5/10.
//  Copyright © 2018年 黄科源. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchpay:(id)sender {
//    {
//        "package": "Sign=WXPay",
//        "appid": "wxdbf9d303afbb7c4d",
//        "sign": "4CF0990E22298AB3812E70F5D2275646",
//        "partnerid": "1499473682",
//        "prepayid": "wx11110944868340fe44be4cc74289957230",
//        "noncestr": "79f15a5f7cf04b769ec7e108caedeec9",
//        "timestamp": "1526008185"
//    }
    PayReq *request = [[PayReq alloc] init];
    
    request.partnerId = @"1499473682";
    
    request.prepayId= @"wx11110944868340fe44be4cc74289957230";
    
    request.package = @"Sign=WXPay";
    
    request.nonceStr= @"79f15a5f7cf04b769ec7e108caedeec9";
    
//    NSString * stamp = @"1525964929";
////
////    request.timeStamp= stamp.intValue;
//    NSNumber *ts = [NSNumber numberWithInt:stamp.intValue];
    
//    request.timeStamp = (UInt32) ts.longValue;
    
    
    NSString *timeStampStr=@"1526008185";
    int timesta=[timeStampStr intValue];
    request.timeStamp = (UInt32)timesta;
    
    
    request.sign= @"4CF0990E22298AB3812E70F5D2275646";
    
    
    
    
    [WXApi sendReq: request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
