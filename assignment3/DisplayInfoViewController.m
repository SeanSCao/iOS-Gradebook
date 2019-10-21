//
//  DisplayInfoViewController.m
//  assignment3
//
//  Created by Sean Cao on 10/17/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import "DisplayInfoViewController.h"

@interface DisplayInfoViewController ()

@end

@implementation DisplayInfoViewController

// Display student info
- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = self.studentInfo.name;
    self.name.backgroundColor = [UIColor whiteColor];
    self.address.text = self.studentInfo.address;
    self.address.backgroundColor = [UIColor whiteColor];
    float average = (0.3 * self.studentInfo.midtermGrade) + (0.4 * self.studentInfo.finalGrade) + self.studentInfo.hw1Grade + self.studentInfo.hw2Grade + self.studentInfo.hw3Grade;
    self.average.text = [NSString stringWithFormat:@"%.02f", average];
    self.average.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed: self.studentInfo.image];
    [self.image setImage:image];
    // Do any additional setup after loading the view.
}
// back button
- (IBAction)buttonReturn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
