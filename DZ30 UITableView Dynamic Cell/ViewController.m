//
//  ViewController.m
//  DZ30 UITableView Dynamic Cell
//
//  Created by Vasilii on 09.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"
#import "SubClass.h"

@interface ViewController ()

@property(strong, nonatomic) SubClass * object;
@property(strong, nonatomic) NSMutableArray* arrayOfNames;
@property(strong, nonatomic) NSMutableArray* arrayOfColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);// делаем отступ 20 сверху
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    
    self.arrayOfNames = [NSMutableArray array];
    self.arrayOfColor = [NSMutableArray array];
    
    //создаем и добавлем в массивы имена и цвета
    for (int i = 0; i <= 1000; i++) {
        
        self.object = [[SubClass alloc] init]; //!!!
        
        CGFloat r = arc4random_uniform(256);
        CGFloat g = arc4random_uniform(256);
        CGFloat b = arc4random_uniform(256);
        
        CGFloat red = (float)r/255;
        CGFloat green = (float)g/255;
        CGFloat blue = (float)b/255;
        
        self.object.name = [NSString stringWithFormat:@"RGB(%.0f, %.0f, %.0f)", r, g, b];
        self.object.color = [self randomColorWhithRed:red green:green blue:blue];
        
        [self.arrayOfNames addObject:self.object.name];
        [self.arrayOfColor addObject:self.object.color];

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - My metods

-(UIColor*) randomColorWhithRed:(CGFloat) r green:(CGFloat) g blue:(CGFloat) b {
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { // количество секций
    
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{//метод заголовка
    return [NSString stringWithFormat:@"RGB random color"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {// количество ячеек
    
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {//вернуть ячейку для каждой секции и каждого ряда
    static NSString *identifier=@"CellClassic";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];// Метод возвращает ссылку на ячейку UITableViewCell по индетификатуру, если ячейка создана и можно её использовать повторно
    if (!cell) {//если ячейки не существует
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
 
    cell.textLabel.text = [self.arrayOfNames objectAtIndex:indexPath.row];
    
    cell.textLabel.textColor = [self.arrayOfColor objectAtIndex:indexPath.row];
    //cell.backgroundColor = [self randomColorWhithRed:red green:green blue:blue];
   
    return cell;
    
}

@end
