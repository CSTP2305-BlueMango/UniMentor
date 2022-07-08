//
//  ProfileViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-01.
//

import Foundation
//import FirebaseAuth
//import FirebaseStorage

class ProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var major: String = ""
    @Published var school: String = ""
    @Published var startDate: Date = Date.now
    @Published var info: String = ""
    @Published var image = Data()
    
    //let storage = Storage.storage()
    
}
