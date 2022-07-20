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
    
    
    @Published var toUser: MessageUser?
    
    @Published var newMessageUser: User?
    
    @Published var isReady = false
    
    @Published var count = 0
    
    init() {
        // fetchMessages()
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
        print("working")
        FirebaseManager.shared.firestore.collection("messages")
            .document(fromId).collection(toId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Fail to fetch current user: \(error)"
                    print("Fail to fetch current user: ", error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        print(data["timestamp"])
                        self.chatMessages.append(.init(id: change.document.documentID, data: data))
                    }
                })
                print("success")
                DispatchQueue.main.async {
                    self.count += 1
                }
                
                self.isReady = true
                print("success finish")
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
            "fromId": fromId,
            "toId": toId,
            "text": self.chatText,
            "timestamp": Date()
        ] as [String : Any]
        
        let document = FirebaseManager.shared.firestore.collection("messages")
            .document(fromId).collection(toId).document()

        document.setData(messageData) { err in
            if let err = err {
                print(err)
                return
            }
            print("Success to send message")
            self.resentMessages()
            self.chatText = ""
            self.count += 1
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
    
    private func resentMessages() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        guard let toId = toUser?.id else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        let document = FirebaseManager.shared.firestore.collection("resent_messages")
            .document(uid).collection("messages").document(toId)
        
        let data = [
            "fromId": uid,
            "id": toId,
            "text": self.chatText,
            "timestamp": Date(),
            "userImage": toUser?.userImage ?? "",
            "userName": toUser?.userName ?? ""
        ] as [String : Any]
        
        document.setData(data) { err in
            if let err = err {
                print(err)
                return
            }
        }
    }
    
    func saveMessageUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        guard let toId = toUser?.id else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        let document = FirebaseManager.shared.firestore.collection("resent_messages")
            .document(uid).collection("messages").document(toId)
        
        let data = [
            "fromId": uid,
            "id": toId,
            "text": self.chatText,
            "timestamp": Date(),
            "userImage": newMessageUser?.image ?? "",
            "userName": newMessageUser?.name ?? ""
        ] as [String : Any]
        
        document.setData(data) { err in
            if let err = err {
                print(err)
                return
            }
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
