//
//  ProfileValidation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-21.
//

import Foundation

/// Validate profile function that will check if all the fields have been entered in correctly for when signing up.

func validateProfileInfo(info: ProfileInfo) throws -> Void {
    
    switch true {
    
    /// image validation
//    case info.imageUrl.isEmpty:
//        throw CustomError.form(field: "image", message: "image required");
    case info.name.isEmpty:
        throw CustomError.form(field: "name", message: "name is required");
        
    /// major validation
    case info.major.isEmpty:
        throw CustomError.form(field: "major", message: "major required");
    case !info.major.hasSpecialChar():
        throw CustomError.form(field: "major", message: "no special character allowed");
    case !info.major.hasInt():
        throw CustomError.form(field: "major", message: "no number allowed");
    
    /// school validation
    case info.school.isEmpty:
        throw CustomError.form(field: "school", message: "school required");
    case !info.school.hasSpecialChar():
        throw CustomError.form(field: "school", message: "no special character allowed");
    case !info.school.hasInt():
        throw CustomError.form(field: "school", message: "no number allowed");
        
    /// start date validation
    case info.startDate.month.isEmpty || info.startDate.year.isEmpty:
        throw CustomError.form(field: "startDate", message: "start date is required")
        
    /// introduction validation
    case info.intro.isEmpty:
        throw CustomError.form(field: "intro", message: "intro required");
    case info.intro.hasMoreWhiteSpacesThan(499):
        throw CustomError.form(field: "intro", message: "500 words maxium");
    default:
        return;
    }
    
}
