//
//  TTStudentDoctor.m
//  Delegate
//
//  Created by sergey on 2/1/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTStudentDoctor.h"

@implementation TTStudentDoctor

- (id)initStudentDoctorWithName:(NSString *)name {
    if (self = [super init]) {
        _doctorName = name;
        _report = [[[NSMutableDictionary alloc]init]autorelease];
    }
    
    return self;
}

- (void)patientBad:(TTPatient *)patient problemPlace:(TTProblem)problem{
    
    NSLog(@"name = %@ temperature = %f and problem place %d",patient.name , patient.temperature,patient.problemPlace);
    
    
    if ((patient.temperature < 35.9f) || (patient.temperature > 37.f && patient.temperature < 38.f)) {
        [patient giveNothing];
        
    } else if (patient.temperature > 38.f) {
        [patient giveWrongPill];
        
    } else if (problem == TTProblemLeg) {
        [patient takeRoentgen];
        
    } else if (problem == TTProblemHead) {
        [patient takePill];
        
    } else if (problem == TTProblemAbdomen) {
        [patient takePill];
        
    } else {
        [patient giveIceScream];
    }
    
    patient.satisfied = arc4random()%2;
    
    [self.report setObject:[NSString stringWithFormat:@"%d",problem] forKey:patient.name];
    
}
@end
