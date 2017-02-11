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

//для супремена

@property(strong, nonatomic) NSMutableArray* perfectStudent;
@property(strong, nonatomic) NSMutableArray* goodStudent;
@property(strong, nonatomic) NSMutableArray* normalStudent;
@property(strong, nonatomic) NSMutableArray* badStudent;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);// делаем отступ 20 сверху
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    
    self.arrayOfStudents = [NSMutableArray array];
    self.arrayOfAverageMarks = [NSMutableArray array];
    
    self.perfectStudent = [NSMutableArray array];
    self.goodStudent = [NSMutableArray array];
    self.normalStudent = [NSMutableArray array];
    self.badStudent = [NSMutableArray array];
    
    
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
        
        if (averageMark >= 4.5f) {
            [self.perfectStudent addObject:[NSNumber numberWithFloat:averageMark]];
        } else if (averageMark < 4.5f && averageMark >= 4.f) {
            [self.goodStudent addObject:[NSNumber numberWithFloat:averageMark]];
        } else if (averageMark < 4.f && averageMark >= 3.f) {
            [self.normalStudent addObject:[NSNumber numberWithFloat:averageMark]];
        } else {
            [self.badStudent addObject:[NSNumber numberWithFloat:averageMark]];
        }
        
        //[self.arrayOfAverageMarks addObject:[NSNumber numberWithFloat:averageMark]];//убираем в супермене
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
    
    return 4;//по числу групп студентов
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{//метод заголовка
    //return [NSString stringWithFormat:@"RGB random color"];
    //return [NSString stringWithFormat:@"Students and average mark"];
    
    NSString* result;
    switch (section) {//завание свича section как и в методе
        case 0:
            return result = [NSString stringWithFormat:@"Perfect students"];
            break;
        case 1:
            return result = [NSString stringWithFormat:@"Good students"];
            break;
        case 2:
            return result = [NSString stringWithFormat:@"Normal students"];
            break;
        case 3:
            return result = [NSString stringWithFormat:@"Bad students"];
            break;
            
        default:
            break;
    }
    return result;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {// количество ячеек
    
    int rowsCont = 0;
    switch (section) {
        case 0:
            rowsCont = (int)[self.perfectStudent count];
            break;
            
        case 1:
            rowsCont = (int)[self.goodStudent count];
            break;
            
        case 2:
            rowsCont = (int)[self.normalStudent count];
            break;
            
        case 3:
            rowsCont = (int)[self.badStudent count];
            break;
            
        default:
            break;
    }
    return rowsCont;
    //return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {//вернуть ячейку для каждой секции и каждого ряда
    static NSString *identifier=@"CellClassic";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];// Метод возвращает ссылку на ячейку UITableViewCell по индетификатуру, если ячейка создана и можно её использовать повторно
    if (!cell) {//если ячейки не существует
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];//UITableViewCellStyleValue1, левый ярлык выровнен по левому и правому краю этикетки на право с синим текстом (используется в настройках)
    }
    
    switch (indexPath.section) {
        case 0:
            if (self.perfectStudent) {
                NSLog(@"Case 0");
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.sortedStudent objectAtIndex:indexPath.row]];//имя и фамилию
                CGFloat studentMark =[[self.perfectStudent objectAtIndex:indexPath.row] floatValue];//оценка
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", studentMark];
                cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor greenColor];
            } else {
                NSLog(@"Not perfect student");
            }
            break;
        case 1:
            if (self.goodStudent) {
                NSLog(@"Case 1");
                cell.textLabel.text = [self.sortedStudent objectAtIndex:indexPath.row + [self.perfectStudent count]];//добавляем из предыдущей строки отличников
                CGFloat studentMark =[[self.perfectStudent objectAtIndex:indexPath.row] floatValue];//оценка
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", studentMark];
                cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor blueColor];
            } else {
                NSLog(@"Not good student");
            }
            break;
        case 2:
            if (self.normalStudent) {
                NSLog(@"Case 2");
                cell.textLabel.text = [self.sortedStudent objectAtIndex:indexPath.row + [self.goodStudent count] + [self.perfectStudent count]];//добавляем из предыдущей строки отличников хорошистов
                CGFloat studentMark =[[self.perfectStudent objectAtIndex:indexPath.row] floatValue];//оценка
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", studentMark];
                cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor blackColor];
            } else {
                NSLog(@"Not normal student");
            }
            break;
        case 3:
            if (self.badStudent) {
                NSLog(@"Case 3");
                cell.textLabel.text = [self.sortedStudent objectAtIndex:indexPath.row + [self.normalStudent count] + [self.goodStudent count] + [self.perfectStudent count]];//добавляем из предыдущей строки отличников хорошистов
                CGFloat studentMark =[[self.perfectStudent objectAtIndex:indexPath.row] floatValue];//оценка
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", studentMark];
                cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor redColor];

            } else {
                NSLog(@"Not bad student");
            }
            break;
            
        default:
            break;
    }
    /*
    CGFloat studentMark = [[self.arrayOfAverageMarks objectAtIndex:indexPath.row]floatValue];
    //cell.textLabel.text = [self.arrayOfNames objectAtIndex:indexPath.row];
    static CGFloat borderMark = 3.0f;
    
    if (studentMark < borderMark) {
        cell.textLabel.text = [self.sortedStudent objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.1f", studentMark];
        cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor redColor];//оба окрашиваем в один цвет
    } else {
        cell.textLabel.text = [self.sortedStudent objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.1f", studentMark];
        cell.detailTextLabel.textColor = cell.textLabel.textColor = [UIColor blackColor];
    }
    
    //cell.textLabel.textColor = [self.arrayOfColor objectAtIndex:indexPath.row];
    //cell.backgroundColor = [self randomColorWhithRed:red green:green blue:blue];
   
   // NSLog(@"IndexPath.row - %d", indexPath.row);
     */
    return cell;
    
}

@end
