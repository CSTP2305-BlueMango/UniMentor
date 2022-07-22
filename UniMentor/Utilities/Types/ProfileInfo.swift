//
//  ProfileInfo.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-21.
//

import Foundation

struct ProfileInfo {
    var name: String = ""
    var major: String = ""
    var school: String = ""
    var intro: String = ""
    var imageUrl: String = ""
    var startDate: StartDate = StartDate()
    
    init() {}
    
    init(_ name: String, _ major: String, _ school: String, _ intro: String, _ imageUrl: String, _ startDate: StartDate) {
        self.name = name;
        self.major = major;
        self.school = school;
        self.intro = intro;
        self.imageUrl = imageUrl;
        self.startDate = startDate;
    }
}

struct StartDate {
    var month: String = ""
    var year: String = ""
    
    //create a date string from month and year
    func join() -> String {
        return "\(month) \(year)";
    }
    
    //make a start date object from a date string
    static func makeStartDateFromString(date: String)-> StartDate {
        let monthAndYear = date.components(separatedBy: " ");
        let month = monthAndYear[0];
        let year  = monthAndYear[1];
        return StartDate(month: month,year: year);
    }
}
