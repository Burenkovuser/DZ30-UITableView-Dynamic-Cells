//
//  SubClass.m
//  DZ30 UITableView Dynamic Cell
//
//  Created by Vasilii on 09.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "SubClass.h"

@implementation SubClass

- (instancetype) init {
    self = [super init];
    if (self) {
        self.color = [UIColor clearColor];
        self.name = @"name";
    }
    return self;
}

@end
