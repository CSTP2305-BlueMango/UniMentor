//
//  UniMentorApp.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-05-19.
//

import SwiftUI
import FirebaseCore


@main
/// Main app start
struct UniMentorApp: App {
    @StateObject var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoadingView()
                .environmentObject(viewModel)
        }
    }
}

