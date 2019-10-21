//
//  NewStudentViewController.h
//  assignment3
//
//  Created by Sean Cao on 10/17/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentInfoClass.h"


@protocol NewStudentDelegate;

@interface NewStudentViewController : UIViewController


@property (nonatomic, weak) id<NewStudentDelegate> delegate;
@property (nonatomic, strong) StudentInfoClass *studentInfo;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *midtermGrade;
@property (weak, nonatomic) IBOutlet UITextField *finalGrade;
@property (weak, nonatomic) IBOutlet UITextField *hw1Grade;
@property (weak, nonatomic) IBOutlet UITextField *hw2Grade;
@property (weak, nonatomic) IBOutlet UITextField *hw3Grade;
@property (weak, nonatomic) IBOutlet UITextField *image;
@property (weak, nonatomic) IBOutlet UILabel *errorMsg;

@end

@protocol NewStudentDelegate <NSObject>

// delegate method for sending data to view controller
- (void)sendDataToA:(NewStudentViewController *)controller
    didFinishEnteringStudent: (StudentInfoClass *)studentInfo;

@end
