//
//  ChatViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

// reference: https://www.youtube.com/watch?v=G0AyApE2w1c&list=PL0dzCUj1L5JEN2aWYFCpqfTBeVHcGZjGw&index=13
class ChatViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var chatText = ""
    @Published var chatMessages = [ChatMessage]()
    
    @Published var toUser: User?
    
    init() {
        // self.toUser = toUser
        fetchMessages()
    }
    
    func fetchMessages() {
        print("test")
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {
            print("Could not find firebase uid")
            return
        }
        
        guard let toId = toUser?.id else {
            print("Could not find firebase uid")
            return
        }
        
        print("passed test")
        
        FirebaseManager.shared.firestore.collection("messages")
            .document(fromId).collection(toId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Fail to fetch current user: \(error)"
                    print("Fail to fetch current user: ", error)
                    return
                }
                
                // print(("\(querySnapshot)"))
                
                querySnapshot?.documents.forEach({queryDocumentSnapshot in
                    guard let message = try? queryDocumentSnapshot.data(as: ChatMessage.self) else {
                        print("No data found")
                        return
                    }
                    
                    // print(message)
                    
                    self.chatMessages.append(message)
                    // print(self.chatMessages)
                })
            }
    }
    
    func sendChat() {
        
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        guard let toId = toUser?.id else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        let messageData = [
            "id": fromId,
            "toId": toId,
            "text": self.chatText,
            "timestamp": getTime()
        ] as [String : Any]
        
        let document = FirebaseManager.shared.firestore.collection("messages")
            .document(fromId).collection(toId).document()

        document.setData(messageData) { err in
            if let err = err {
                print(err)
                return
            }
            print("Success to send message")
            self.chatText = ""
        }
        
        let recipientMessageDocument = FirebaseManager.shared.firestore.collection("messages")
            .document(toId).collection(fromId).document()

        recipientMessageDocument.setData(messageData) { err in
            if let err = err {
                print(err)
                return
            }

            print("Recipient saved message as well")
        }
    }
    
    
    // reference: https://mammothinteractive.com/get-current-time-with-swiftui-hacking-swift-5-5-xcode-13-and-ios-15/
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
}
