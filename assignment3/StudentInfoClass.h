//
//  StudentInfoClass.h
//  assignment3
//
//  Created by Sean Cao on 10/18/19.
//  Copyright © 2019 Sean Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentInfoClass : NSObject{
    NSString *name;
    NSString *address;
    float midtermGrade;
    float finalGrade;
    int hw1Grade;
    int hw2Grade;
    int hw3Grade;
}

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *address;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, readwrite) float midtermGrade;
@property(nonatomic, readwrite) float finalGrade;
@property(nonatomic, readwrite) int hw1Grade;
@property(nonatomic, readwrite) int hw2Grade;
@property(nonatomic, readwrite) int hw3Grade;

-(void) Print_Object;
-(bool) Student_Average;

@end
