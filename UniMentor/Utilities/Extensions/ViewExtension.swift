//
//  HiddenNavigation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import SwiftUI

extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    func navigationBar(backButton: Bool, barHidden: Bool, title: String = " ") -> some View {
        self
            .navigationBarTitle("")
            .navigationBarHidden(!backButton)
            .navigationBarBackButtonHidden(false)
    }
    
    // format startDate
    func separateDate(startDate: String) -> [String] {
        // seperate month and year
        let result = startDate.components(separatedBy: " ")
        return result
    }
}
