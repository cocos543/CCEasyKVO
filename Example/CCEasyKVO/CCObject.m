//
//  CCObject.m
//  CCEasyKVO_Example
//
//  Created by Cocos on 2020/2/21.
//  Copyright © 2020 Cocos. All rights reserved.
//

#import "CCObject.h"

@implementation CCObject

- (void)dealloc {
    NSLog(@"CCObject[%p] dealloc", self);
}

@end
