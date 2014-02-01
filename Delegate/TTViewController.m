//
//  TTViewController.m
//  Delegate
//
//  Created by sergey on 1/28/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"
#import "TTPatient.h"
#import "TTDoctor.h"
#import "TTStudentDoctor.h"

#define MIN_TEMP 35.f
#define MAX_TEMP 42.f

@interface TTViewController ()

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    TTDoctor *doctor = [[[TTDoctor alloc]initDoctorWithName:@"Evgeniy"]autorelease];
    TTStudentDoctor *studentDoctor1 = [[[TTStudentDoctor alloc]initStudentDoctorWithName:@"Ivan"]autorelease];
    TTStudentDoctor *studentDoctor2 = [[[TTStudentDoctor alloc]initStudentDoctorWithName:@"Petya"]autorelease];
    NSMutableArray *arrayWithPatient = [[[NSMutableArray alloc]init]autorelease];
    NSInteger patientCount = 20;
    
    for (int i = 0; i < patientCount; i++) {
        TTPatient *patient = [[[TTPatient alloc]initPatientWithName:[NSString stringWithFormat:@"patient%d",i]
                                                 patientTemperature:[self randFloatMin:MIN_TEMP andMax:MAX_TEMP]
                                                       problemPlace:(TTProblem)arc4random_uniform(3)]autorelease];
        
        switch(arc4random_uniform(3)) {
            case 0:
                [patient setDelegate:doctor];
                break;
            case 1:
                [patient setDelegate:studentDoctor1];
                break;
            case 2:
                [patient setDelegate:studentDoctor2];
                break;
        }
        
        [arrayWithPatient addObject:patient];
    }
    
    for (TTPatient *obj in arrayWithPatient) {    
        if (![obj patientCondition]) {
            NSLog(@"%@ problem %d",obj.name,obj.problemPlace);
        }
    }

}

- (float)randFloatMin:(float)low andMax:(float)high {
    CGFloat diff = high - low;
    CGFloat new = (((CGFloat) rand() / RAND_MAX) * diff) + low;
    return round(10 * new) / 10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
