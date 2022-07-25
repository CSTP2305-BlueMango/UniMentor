//
//  FirebaseManager.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-01.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

///reference: https://www.letsbuildthatapp.com/course_video?id=7135
///this tutorial shows how to install FirebaseAuth for login
///using SPM or Swift Package Manager is faster than CocoaPods
///
///ON FIREBASE: ensure to enable Authentication for sign-in providers, it will crash if you don't
///
///this is a singleton object
class FirebaseManager: NSObject {

    ///ensure to setup this up bc it will crash
    let auth: Auth
    let storage: Storage
    let firestore: Firestore

    ///reference error: https://stackoverflow.com/questions/38536257/ios-extension-fatal-exception-com-firebase-core-default-app-has-already-been
    //this will configure createAnAccount
    //this is a singleton object
    static let shared = FirebaseManager()

    //initialize here
    override init() {
        FirebaseApp.configure()

        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()

        super.init()
    }

}
