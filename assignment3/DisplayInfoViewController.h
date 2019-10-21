//
//  DisplayInfoViewController.h
//  assignment3
//
//  Created by Sean Cao on 10/17/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentInfoClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface DisplayInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *average;

@property (nonatomic, assign) StudentInfoClass *studentInfo;
@end

NS_ASSUME_NONNULL_END
