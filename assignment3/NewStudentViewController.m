//
//  NewStudentViewController.m
//  assignment3
//
//  Created by Sean Cao on 10/17/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import "NewStudentViewController.h"

@interface NewStudentViewController ()

@end

@implementation NewStudentViewController

@synthesize delegate;

// back button
- (IBAction)buttonReturn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Submitting new student
- (IBAction)onSubmit:(id)sender {
    bool valid = true;
    if([self.name.text isEqualToString:@""]){
        self.errorMsg.text = @"Name field cannot be empty";
        valid = false;
    } else if([self.address.text isEqualToString:@""]){
        self.errorMsg.text = @"Address field cannot be empty";
        valid = false;
    } else if([self.midtermGrade.text floatValue] > 100.0 || [self.midtermGrade.text floatValue] < 0.0){
        self.errorMsg.text = @"Midterm field must be between 0 and 100";
        valid = false;
    } else if([self.finalGrade.text floatValue] > 100.0 || [self.finalGrade.text floatValue] < 0.0){
        self.errorMsg.text = @"Final field must be between 0 and 100";
        valid = false;
    } else if([self.hw1Grade.text intValue] > 10 || [self.hw1Grade.text intValue] < 0){
        self.errorMsg.text = @"HW1 field must be between 0 and 10";
        valid = false;
    } else if([self.hw2Grade.text intValue] > 10 || [self.hw2Grade.text intValue] < 0){
        self.errorMsg.text = @"HW2 field must be between 0 and 10";
        valid = false;
    } else if([self.hw3Grade.text intValue] > 10 || [self.hw3Grade.text intValue] < 0){
        self.errorMsg.text = @"HW3 field must be between 0 and 10";
        valid = false;
    } else {
        StudentInfoClass *info = [[StudentInfoClass alloc]init];
        info.name = self.name.text;
        info.address = self.address.text;
        info.image = self.image.text;
        info.midtermGrade = [self.midtermGrade.text floatValue];
        info.finalGrade = [self.finalGrade.text floatValue];
        info.hw1Grade = [self.hw1Grade.text intValue];
        info.hw2Grade = [self.hw2Grade.text intValue];
        info.hw3Grade = [self.hw3Grade.text intValue];
        
        [self.delegate sendDataToA:self didFinishEnteringStudent:info];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
