//
//  ProfileViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-01.
//

import Foundation
import UIKit

class ProfileViewModel: ObservableObject {
    @Published var major: String = ""
    @Published var school: String = ""
    @Published var startDate: Date = Date.now
    @Published var info: String = ""
    @Published var image: UIImage?
    
    @Published var about: String = ""
}
