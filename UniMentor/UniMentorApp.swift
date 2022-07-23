//
//  UniMentorApp.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-05-19.
//

import SwiftUI
import FirebaseCore


@main
struct UniMentorApp: App {
    @StateObject var viewModel = AppViewModel()
    // @StateObject var userVM = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoadingView()
                .environmentObject(viewModel)
                // .environmentObject(userVM)
        }
    }
}

