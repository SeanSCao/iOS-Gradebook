//
//  ViewController.h
//  assignment3
//
//  Created by Sean Cao on 10/17/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentInfoClass.h"
#import "NewStudentViewController.h"

@interface ViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *student;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *midtermGrade;
@property (weak, nonatomic) IBOutlet UITextField *finalGrade;
@property (weak, nonatomic) IBOutlet UITextField *hw1Grade;
@property (weak, nonatomic) IBOutlet UITextField *hw2Grade;
@property (weak, nonatomic) IBOutlet UITextField *hw3Grade;
@property (weak, nonatomic) IBOutlet UILabel *errorMsg;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentCtrl;
- (IBAction)segmentChange:(id)sender;

@property (nonatomic, strong) NSMutableArray *mutableStudentArray;
@property (nonatomic, strong) StudentInfoClass *studentInfo;
- (bool) Add_Student: (NSString*) name
             address: (NSString*) address
               image: (NSString*) image
            finalGrade:(float) finalGrade
             midterm:(float) midtermGrade
                 hw1:(int) hw1Grade
                 hw2:(int) hw2Grade
                 hw3:(int) hw3Grade;
@end

