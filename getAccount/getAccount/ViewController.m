//
//  ViewController.m
//  getAccount
//
//  Created by zhanghua on 2018/12/22.
//  Copyright © 2018 olivierzhang. All rights reserved.
//

#import "ViewController.h"
#import <dlfcn.h>
#import <objc/runtime.h>


@interface SSAccount : NSObject
@property (copy) NSString *accountName;
@property (retain) NSNumber *uniqueIdentifier;
@end

@interface SSAccountStore : NSObject
+ (id)defaultStore;
@end

@interface SSClientAccountStore : SSAccountStore

- (id)activeAccount;
- (id)accounts;

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    void *ssHandle = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", RTLD_NOW);
    
    SSClientAccountStore *SSClientAccountStore = [objc_getClass("SSAccountStore") defaultStore];
    SSAccount *mSSAccount = [SSClientAccountStore activeAccount];
    
    dlclose(ssHandle);
    
    NSString *accountName = mSSAccount.accountName;
    
    UILabel *lab = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
    lab.text = accountName;
    [self.view addSubview:lab];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
