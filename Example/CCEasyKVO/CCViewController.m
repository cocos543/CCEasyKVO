//
//  CCViewController.m
//  CCEasyKVO
//
//  Created by Cocos on 02/21/2020.
//  Copyright (c) 2020 Cocos. All rights reserved.
//

#import "CCViewController.h"
#import "NSObject+CCEasyKVO.h"
#import "CCObject.h"

@interface CCViewController ()

@property (nonatomic, strong) CCObject *obj;

@end

@implementation CCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    UIColor *col = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];;
    self.view.backgroundColor = col;
}

- (IBAction)objClick:(id)sender {
    NSLog(@"\n");
    NSLog(@"Old obj[%p] has been removed", self.obj);
    self.obj = [[CCObject alloc] init];
    NSLog(@"New obj[%p] has been created", self.obj);
    NSLog(@"\n");
    
    id obj = self.obj;
    [self.obj cc_easyObserve:self.view forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew block:^(id object, NSDictionary<NSKeyValueChangeKey, id> *change) {
        NSLog(@"1. obj[%p] found a new color:%@", obj, change[NSKeyValueChangeNewKey]);
    }];

    [self.obj cc_easyObserve:self.view forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew block:^(id object, NSDictionary<NSKeyValueChangeKey, id> *change) {
        NSLog(@"2. obj[%p] found a new color:%@", obj, change[NSKeyValueChangeNewKey]);
    }];
    
    [self.obj cc_easyObserve:self.view forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew block:^(id object, NSDictionary<NSKeyValueChangeKey, id> *change) {
        NSLog(@"3. obj[%p] found a new color:%@", obj, change[NSKeyValueChangeNewKey]);
    }];
}

@end
