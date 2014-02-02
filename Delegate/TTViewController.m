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
    NSInteger patientCount = 40;
    
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
        [obj patientCondition];
    }
    
    [self sortReport:doctor];
    [self sortReport:studentDoctor1];
    [self sortReport:studentDoctor2];
    
    NSLog(@"________________________________________________");
    
    for (TTPatient *obj in arrayWithPatient) {
        
        if (obj.satisfied) {
            
            if ([[obj.delegate doctorName] isEqualToString:doctor.doctorName]) {
                
                obj.delegate = studentDoctor1;
                
                NSLog(@"%@ change doctor from %@ to %@",obj.name, doctor.doctorName, [obj.delegate doctorName]);

            } else if ([[obj.delegate doctorName] isEqualToString:studentDoctor1.doctorName]) {
                
                obj.delegate = studentDoctor2;
                NSLog(@"%@ change doctor from %@ to %@",obj.name, studentDoctor1.doctorName, [obj.delegate doctorName]);
                
            } else if ([[obj.delegate doctorName] isEqualToString:studentDoctor2.doctorName]) {
                
                obj.delegate = doctor;
                NSLog(@"%@ change doctor from %@ to %@",obj.name, studentDoctor2.doctorName, [obj.delegate doctorName]);
                
            }
        }
        
    }
}

- (float)randFloatMin:(float)low andMax:(float)high {
    CGFloat diff = high - low;
    CGFloat new = (((CGFloat) rand() / RAND_MAX) * diff) + low;
    return round(10 * new) / 10;
}

- (void)sortReport:(id)doctor {
    
    NSMutableDictionary *report = [doctor report];
    
    NSArray *dic = [report keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"________________________________________________Doctor %@ report",[doctor doctorName]);
    for (NSString *key in dic) {
        NSLog(@"%@ have symptom %@",key ,[report objectForKey:key]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
