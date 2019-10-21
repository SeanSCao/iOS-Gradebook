//
//  ViewController.m
//  assignment3
//
//  Created by Sean Cao on 10/17/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import "ViewController.h"
#import "NewStudentViewController.h"
#import "DisplayInfoViewController.h"

@interface ViewController () <NewStudentDelegate>

@end

@implementation ViewController

// Name UITextField Changed
- (IBAction)nameChange:(id)sender {
    [self Update_Student_Info];
}
// Address UITextField Changed
- (IBAction)addressChange:(id)sender {
    [self Update_Student_Info];
}
// Midterm UITextField Changed
- (IBAction)midtermChange:(id)sender {
    [self Update_Student_Info];
}
// Final UITextField Changed
- (IBAction)finalChange:(id)sender {
    [self Update_Student_Info];
}
// HW1 UITextField Changed
- (IBAction)hw1Change:(id)sender {
    [self Update_Student_Info];
}
// HW2 UITextField Changed
- (IBAction)hw2Change:(id)sender {
    [self Update_Student_Info];
}
// HW3 UITextField Changed
- (IBAction)hw3Change:(id)sender {
    [self Update_Student_Info];
}

// Getter for NSMutableArray, initializes array if empty
- (NSMutableArray *)mutableStudentArray{
    if(_mutableStudentArray == nil){
        _mutableStudentArray = [[NSMutableArray alloc] init];
    }
    return _mutableStudentArray;
}
// Left arrow clicked, cycle to previous student
- (IBAction)previousStudent:(id)sender {
    if([self Update_Student_Info]){
        int prevIndex = (int)[self.mutableStudentArray indexOfObject:self.studentInfo] -1;
        if(prevIndex < 0){
            self.studentInfo = [self.mutableStudentArray lastObject];
        } else {
            self.studentInfo = [self.mutableStudentArray objectAtIndex:prevIndex];
        }
        self.student.text = self.studentInfo.name;
        self.address.text = self.studentInfo.address;
        self.midtermGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.midtermGrade];
        self.finalGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.finalGrade];
        self.hw1Grade.text = [NSString stringWithFormat:@"%.02d", self.studentInfo.hw1Grade];
        self.hw2Grade.text = [NSString stringWithFormat:@"%.02d", self.studentInfo.hw2Grade];
        self.hw3Grade.text = [NSString stringWithFormat:@"%.02d", self.studentInfo.hw3Grade];
    }
}
// Right arrow clicked, cycle to next student
- (IBAction)nextStudent:(id)sender {
    if([self Update_Student_Info]){
        int nextIndex = (int)[self.mutableStudentArray indexOfObject:self.studentInfo] + 1;
        int length = (int)[self.mutableStudentArray count];
        if(nextIndex >= length){
            self.studentInfo = [self.mutableStudentArray firstObject];
        } else {
            self.studentInfo = [self.mutableStudentArray objectAtIndex:nextIndex];
        }
        self.student.text = self.studentInfo.name;
        self.address.text = self.studentInfo.address;
        self.midtermGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.midtermGrade];
        self.finalGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.finalGrade];
        self.hw1Grade.text = [NSString stringWithFormat:@"%d", self.studentInfo.hw1Grade];
        self.hw2Grade.text = [NSString stringWithFormat:@"%d", self.studentInfo.hw2Grade];
        self.hw3Grade.text = [NSString stringWithFormat:@"%d", self.studentInfo.hw3Grade];
    }
}
// Changes student info using slider
- (IBAction)sliderChanged:(id)sender {
    int sliderValue = self.slider.value;
    self.studentInfo = [self.mutableStudentArray objectAtIndex:sliderValue];
    self.student.text = self.studentInfo.name;
    self.address.text = self.studentInfo.address;
    self.midtermGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.midtermGrade];
    self.finalGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.finalGrade];
    self.hw1Grade.text = [NSString stringWithFormat:@"%d.02", self.studentInfo.hw1Grade];
    self.hw2Grade.text = [NSString stringWithFormat:@"%d.02", self.studentInfo.hw2Grade];
    self.hw3Grade.text = [NSString stringWithFormat:@"%d.02", self.studentInfo.hw3Grade];
}

// Updates all info upon edit end
- (bool) Update_Student_Info{
    if([self.student.text isEqualToString:@""]){
        self.errorMsg.text = @"Name field cannot be empty";
        return false;
    } else if([self.address.text isEqualToString:@""]){
        self.errorMsg.text = @"Address field cannot be empty";
        return false;
    } else if([self.midtermGrade.text floatValue] > 100.0 || [self.midtermGrade.text floatValue] < 0.0){
        self.errorMsg.text = @"Midterm field must be between 0 and 100";
        return false;
    } else if([self.finalGrade.text floatValue] > 100.0 || [self.finalGrade.text floatValue] < 0.0){
        self.errorMsg.text = @"Final field must be between 0 and 100";
        return false;
    } else if([self.hw1Grade.text intValue] > 10 || [self.hw1Grade.text intValue] < 0){
        self.errorMsg.text = @"HW1 field must be between 0 and 10";
        return false;
    } else if([self.hw2Grade.text intValue] > 10 || [self.hw2Grade.text intValue] < 0){
        self.errorMsg.text = @"HW2 field must be between 0 and 10";
        return false;
    } else if([self.hw3Grade.text intValue] > 10 || [self.hw3Grade.text intValue] < 0){
        self.errorMsg.text = @"HW3 field must be between 0 and 10";
        return false;
    } else {
        self.errorMsg.text = @"HW3 field must be between 0 and 10";
        int index = (int)[self.mutableStudentArray indexOfObject:self.studentInfo];
        [self.mutableStudentArray removeObjectAtIndex:index];
        self.studentInfo.name = self.student.text;
        self.studentInfo.address = self.address.text;
        self.studentInfo.midtermGrade = [self.midtermGrade.text floatValue];
        self.studentInfo.finalGrade = [self.finalGrade.text floatValue];
        self.studentInfo.hw1Grade = [self.hw1Grade.text intValue];
        self.studentInfo.hw2Grade = [self.hw2Grade.text intValue];
        self.studentInfo.hw3Grade = [self.hw3Grade.text intValue];
        [self.mutableStudentArray insertObject:self.studentInfo atIndex:index];
        self.errorMsg.text = @"";
        return true;
    }
}

// Add student to NSMutableArray
- (bool) Add_Student: (NSString*) name
             address: (NSString*) address
               image: (NSString*) image
               finalGrade:(float) finalGrade
             midterm:(float) midtermGrade
                 hw1:(int) hw1Grade
                 hw2:(int) hw2Grade
                 hw3:(int) hw3Grade{
    bool toAdd = true;
    for (StudentInfoClass *info in self.mutableStudentArray){
        if([info.name isEqualToString:name]){
            toAdd = false;
            return false;
        }
    }
    if(toAdd){
        StudentInfoClass *info = [[StudentInfoClass alloc]init];
        info.name = name;
        info.address = address;
        info.image = image;
        info.midtermGrade = midtermGrade;
        info.finalGrade = finalGrade;
        info.hw1Grade = hw1Grade;
        info.hw2Grade = hw2Grade;
        info.hw3Grade = hw3Grade;

        [self.mutableStudentArray addObject:info];
        self.slider.maximumValue += 1;
    }
    return true;
}

// Delegate method for passing data back from new student view
- (void)sendDataToA:(NewStudentViewController *)controller
    didFinishEnteringStudent:(StudentInfoClass *)studentInfo
{
    [controller dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", studentInfo.name);
    [self Add_Student:studentInfo.name address:studentInfo.address image:studentInfo.image finalGrade:studentInfo.finalGrade midterm:studentInfo.midtermGrade hw1:studentInfo.hw1Grade hw2:studentInfo.hw2Grade hw3:studentInfo.hw3Grade];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Add_Student:@"Sean" address:@"New York" image:@"smudge.jpg" finalGrade:100.0 midterm:100.0 hw1:10 hw2:10 hw3:10];
    [self Add_Student:@"Phoebe" address:@"Hong Kong" image:@"smudge.jpg" finalGrade:100.0 midterm:80.0 hw1:5 hw2:10 hw3:10];
    [self Add_Student:@"Angela" address:@"Irvine" image:@"dog.jpg" finalGrade:50.0 midterm:100.0 hw1:10 hw2:10 hw3:10];
    [self Add_Student:@"Jordy" address:@"Seattle" image:@"dog.jpg" finalGrade:100.0 midterm:70.0 hw1:10 hw2:0 hw3:10];
    self.studentInfo = [self.mutableStudentArray firstObject];
    self.student.text = self.studentInfo.name;
    self.address.text = self.studentInfo.address;
    self.midtermGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.midtermGrade];
    self.finalGrade.text = [NSString stringWithFormat:@"%.02f", self.studentInfo.finalGrade];
    self.hw1Grade.text = [NSString stringWithFormat:@"%d", self.studentInfo.hw1Grade];
    self.hw2Grade.text = [NSString stringWithFormat:@"%d", self.studentInfo.hw2Grade];
    self.hw3Grade.text = [NSString stringWithFormat:@"%d", self.studentInfo.hw3Grade];
    self.slider.maximumValue = (int)[self.mutableStudentArray count] - 1;
    // Do any additional setup after loading the view.
}

// Start segue based on segmented control
- (IBAction)segmentChange:(id)sender {
    if(_segmentCtrl.selectedSegmentIndex==0){
    }
    else if(_segmentCtrl.selectedSegmentIndex==1){
        if([self Update_Student_Info]){
            [self performSegueWithIdentifier:@"showDisplayInfo" sender:self];
        }
        _segmentCtrl.selectedSegmentIndex = 0;
    }
    else{
        if([self Update_Student_Info]){
            [self performSegueWithIdentifier:@"showNewStudent" sender:self];
        }
        _segmentCtrl.selectedSegmentIndex = 0;
    }
}

// Segue for display info view
- (void) showDisplayInfoForSegue:(UIStoryboardSegue *) segue sender:(id)sender{
    DisplayInfoViewController *displayInfoController = segue.destinationViewController;
    displayInfoController.studentInfo = self.studentInfo;
}

// Segue for new student view
- (void) showNewStudentForSegue:(UIStoryboardSegue *) segue sender:(id)sender{
    NewStudentViewController *newStudentViewController = segue.destinationViewController;
    newStudentViewController.delegate = self;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showDisplayInfo" ]){
        [self showDisplayInfoForSegue:segue sender: sender];
    }
    else if ([segue.identifier isEqualToString:@"showNewStudent" ]){
        [self showNewStudentForSegue:segue sender: sender];
    }
} // end prepareForSegue

@end
