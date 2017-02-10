//
//  SubClass.h
//  DZ30 UITableView Dynamic Cell
//
//  Created by Vasilii on 09.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SubClass : NSObject

@property (weak, nonatomic) UIColor *color;//импортируем UIKit чтобы заработало
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;


@end
