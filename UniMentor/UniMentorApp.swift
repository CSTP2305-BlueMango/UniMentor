//
//  UniMentorApp.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-05-19.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct UniMentorApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            NavigationView {
                // TabBarView()
                LoadingView().environmentObject(viewModel)
            }
            .navigationViewStyle(.stack)
            .statusBar(hidden: false)
            //:NAVIGATION
        }
    }
}

