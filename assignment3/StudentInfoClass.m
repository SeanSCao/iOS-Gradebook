//
//  StudentInfoClass.m
//  assignment3
//
//  Created by Sean Cao on 10/18/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import "StudentInfoClass.h"

@implementation StudentInfoClass

@synthesize name;
@synthesize address;
@synthesize image;
@synthesize midtermGrade;
@synthesize finalGrade;
@synthesize hw1Grade;
@synthesize hw2Grade;
@synthesize hw3Grade;

-(id)init {
    self = [super init];
    midtermGrade = -1;
    finalGrade = -1;
    hw1Grade = -1;
    hw2Grade = -1;
    hw3Grade = -1;
    return self;
}

@end
