//
//  ViewController.m
//  getAccount
//
//  Created by zhanghua on 2018/12/22.
//  Copyright © 2018 olivierzhang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSBundle *bundle = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/StoreServices.framework"];
    if ([bundle load]) {
        Class SSAccountStore_class = objc_getClass("SSAccountStore");
        id store = [SSAccountStore_class performSelector:@selector(defaultStore)];
        id account = [store performSelector:@selector(activeAccount)];
        
        NSString *accountName = [account performSelector:@selector(accountName)];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        lab.text = accountName;
        [self.view addSubview:lab];
        
        self.view.backgroundColor = [UIColor greenColor];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
