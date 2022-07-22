//
//  ProfileViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile = ProfileInfo()
    
    /// profile major error message
    @Published var majorError: String? = "";
    
    /// profile school error message
    @Published var schoolError: String? = "";
    
    /// profile start date error message
    @Published var startDateError: String? = "";
    
    /// profile information error message
    @Published var introError: String? = "";
    
    /// profile name error message
    @Published var nameError: String? = "";
    
    init(name: String) {
        self.profile.name = name;
    }
    
    init(info: ProfileInfo) {
        self.profile = info;
    }
    
    init() {}
        
    func handleSubmit(onSuccess: @escaping (ProfileInfo)->Void) {
        do {
            resetError();
            try validateProfileInfo(info: profile);
            onSuccess(profile);
        } catch CustomError.form(let field, let message) {
            print(profile.name)
            switch field {
            case "name":
                nameError = message;
            case "major":
                majorError = message;
            case "school":
                schoolError = message;
            case "intro":
                introError = message;
            case "startDate":
                startDateError = message;
            default:
                return;
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetError() {
        nameError = "";
        majorError = "";
        schoolError = "";
        startDateError = "";
        introError = "";
    }
    
}
