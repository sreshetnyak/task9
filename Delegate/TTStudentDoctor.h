//
//  TTStudentDoctor.h
//  Delegate
//
//  Created by sergey on 2/1/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTPatient.h"

@interface TTStudentDoctor : NSObject <TTPatientDelegate>

@property (strong,nonatomic) NSString *doctorName;
@property (strong,nonatomic) NSMutableDictionary *report;

- (id)initStudentDoctorWithName:(NSString *)name;

@end
