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
    
    NSLog(@"name = %@ temperature = %f",patient.name , patient.temperature);
    
    
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
    
    [self.report setObject:patient forKey:[NSString stringWithFormat:@"%d",problem]];
    
}
@end
