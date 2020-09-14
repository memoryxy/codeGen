//
//  ViewController.h
//  codeGen
//
//  Created by wangjianfei on 2020/9/14.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, assign) NSInteger liveId;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger countdownTime;
@property (nonatomic, assign) BOOL subscribed;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bgPic;
@property (nonatomic, copy) NSString *coverPic;
@property (nonatomic, copy) NSString *coverSubPic;
@property (nonatomic, copy) NSArray *pullUrls;
@property (nonatomic, copy) NSString *buyingDes;
@property (nonatomic, copy) NSString *warnings;
@property (nonatomic, strong) <#Class#> shareInfo;
@property (nonatomic, assign) NSInteger viewCount;
@property (nonatomic, strong) <#Class#> anchorInfo;
@property (nonatomic, strong) <#Class#> livePasterBean;

@end

