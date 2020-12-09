//
//  ViewController.m
//  codeGen
//
//  Created by wangjianfei on 2020/9/14.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *strInFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mockData" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[strInFile dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    NSString *result = @"\n";
    NSArray *splitedAr = [strInFile componentsSeparatedByString:@"\n"];
        
    for (NSString *str in splitedAr) {
        NSArray *splitedByQuote = [str componentsSeparatedByString:@"\""];
        NSString *outerKey = nil;
        if (splitedByQuote.count > 2) {
            outerKey = splitedByQuote[1];
        } else {
            continue;
        }
        
        for (NSString *key in dic.allKeys) {
            NSObject *v = dic[key];
            NSString *boolClass = @"__NSCFBoolean";
            Class boolCls = NSClassFromString(boolClass);
            NSString *intClass = @"__NSCFNumber";
            Class intCls = NSClassFromString(intClass);

            NSString *temp = @"";
            if ([v isKindOfClass:NSString.class]) {
                temp = [temp stringByAppendingFormat:@"///\n@property (nonatomic, copy) NSString *%@;\n", key];
            } else if ([v isKindOfClass:boolCls]) {
                temp = [temp stringByAppendingFormat:@"///\n@property (nonatomic, assign) BOOL %@;\n", key];
            } else if ([v isKindOfClass:intCls]) {
                temp = [temp stringByAppendingFormat:@"///\n@property (nonatomic, assign) NSInteger %@;\n", key];
            } else if ([v isKindOfClass:NSDictionary.class]) {
                temp = [temp stringByAppendingFormat:@"///\n@property (nonatomic, strong) <#Class#> *%@;\n", key];
            } else if ([v isKindOfClass:NSArray.class]) {
                temp = [temp stringByAppendingFormat:@"///\n@property (nonatomic, copy) NSArray<<#Class *#>> *%@;\n", key];
            } else {
                NSAssert(NO, @"Format can't be parsed!");
            }
            
            if ([outerKey isEqualToString:key]) {
                result = [result stringByAppendingString:temp];
            }
        }
    }
    
    NSLog(@"%@", result);
}

@end
