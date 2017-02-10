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
@property(strong, nonatomic) SubClass * student;
@property(strong, nonatomic) NSMutableArray* arrayOfNames;
@property(strong, nonatomic) NSMutableArray* arrayOfColor;
@property(strong, nonatomic) NSMutableArray* arrayOfStudents;
@property(strong, nonatomic) NSArray* arrayOfStudentNames;
@property(strong, nonatomic) NSArray* arrayOfStudentSurnames;
@property(strong, nonatomic) NSMutableArray* arrayOfAverageMarks;

@property(strong, nonatomic) NSArray* sortedStudent;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);// делаем отступ 20 сверху
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    
    self.arrayOfStudents = [NSMutableArray array];
    self.arrayOfAverageMarks = [NSMutableArray array];
    
    self.arrayOfStudentNames = [NSArray arrayWithObjects:@"Ivan", @"Olga", @"Igor", @"Max", @"Sveta", @"Mila", @"Anna", @"Vika", @"Petr", @"Alex", @"Vasilii", @"Roman", @"Masha", @"Donald", @"Den", @"Fedor", @"Alla", @"Elena", @"Nicolay", @"Semen", nil];
    self.arrayOfStudentSurnames = [NSArray arrayWithObjects:@"Ivanov", @"Black", @"Petrov", @"White", @"Price",@"Green", @"Pinck", @"Apple", @"Yellow", @"Red", @"Grey", @"Silver", @"Gold", @"Orange", @"Tree", @"Free", @"Wood", @"Forest", @"Ligth", @"Sun", nil];
    
    for (int i = 0; i < 20; i++) {
        self.student = [[SubClass alloc] init];//инициализируем
        
        int randomName = arc4random_uniform((int)[self.arrayOfStudentNames count]);//перменная для случайного выбора
        int randomSurname = arc4random_uniform((int)[self.arrayOfStudentSurnames count]);
        
        self.student.name = [self.arrayOfStudentNames objectAtIndex:randomName];// выбираем имя из массива
        self.student.surname = [self.arrayOfStudentSurnames objectAtIndex:randomSurname];
        
        [self.arrayOfStudents addObject:[NSString stringWithFormat:@"%@ %@", self.student.surname, self.student.name]];//скадываем студентов в массив
        
        CGFloat averageMark = (float) (arc4random_uniform(41) + 10) / 10;// оценки от 1 до 5 с дробной частью
        
        [self.arrayOfAverageMarks addObject:[NSNumber numberWithFloat:averageMark]];
    }
    
    self.sortedStudent = [NSArray array];
    self.sortedStudent = [self.arrayOfStudents sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    /*
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
    */
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - My metods

-(UIColor*) randomColorWhithRed:(CGFloat) r green:(CGFloat) g blue:(CGFloat) b {
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

-(UIColor*) randomColor {
    
    CGFloat r  = (float)arc4random_uniform(256) / 255;
    CGFloat g  = (float)arc4random_uniform(256) / 255;
    CGFloat b  = (float)arc4random_uniform(256) / 255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { // количество секций
    
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{//метод заголовка
    //return [NSString stringWithFormat:@"RGB random color"];
    return [NSString stringWithFormat:@"Students and average mark"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {// количество ячеек
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {//вернуть ячейку для каждой секции и каждого ряда
    static NSString *identifier=@"CellClassic";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];// Метод возвращает ссылку на ячейку UITableViewCell по индетификатуру, если ячейка создана и можно её использовать повторно
    if (!cell) {//если ячейки не существует
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    CGFloat studentMark = [[self.arrayOfAverageMarks objectAtIndex:indexPath.row]floatValue];
    //cell.textLabel.text = [self.arrayOfNames objectAtIndex:indexPath.row];
    static CGFloat borderMark = 3.0f;
    
    if (studentMark < borderMark) {
        cell.textLabel.text = [self.sortedStudent objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.1f", studentMark];
        cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor redColor];
    } else {
        cell.textLabel.text = [self.sortedStudent objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.1f", studentMark];
        cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor blackColor];
    }
    
    //cell.textLabel.textColor = [self.arrayOfColor objectAtIndex:indexPath.row];
    //cell.backgroundColor = [self randomColorWhithRed:red green:green blue:blue];
   
   // NSLog(@"IndexPath.row - %d", indexPath.row);
    return cell;
    
}

@end
