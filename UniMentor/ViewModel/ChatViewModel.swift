//
//  ChatViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

// reference: https://www.youtube.com/watch?v=G0AyApE2w1c&list=PL0dzCUj1L5JEN2aWYFCpqfTBeVHcGZjGw&index=13
/// handle chat message from database
class ChatViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    /// typed chat text
    @Published var chatText = ""
    /// chat messsages list
    @Published var chatMessages = [ChatMessage]()
    /// recieving user
    @Published var toUser: MessageUser?
    /// fetching messages state
    @Published var isReady = false
    /// scroll to buttom
    @Published var count = 0
    
    /// fetch all messages of user with recieving user
    func fetchMessages() {
        chatMessages = []
        // current user id
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "fetchMessages: Could not find current uid"
            return
        }
        // sending user id
        guard let toId = toUser?.id else {
            self.errorMessage = "fetchMessages: Could not find recieving user uid"
            return
        }
        // fetching messages from messages collection ordered by timestemp
        FirebaseManager.shared.firestore.collection("messages")
            .document(fromId).collection(toId).order(by: "time")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "fetchMessages: Fail to fetch messages of user: \(error)"
                    return
                }
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.chatMessages.append(.init(id: change.document.documentID, data: data))
                    }
                })
                // for scoll to bottom
                DispatchQueue.main.async {
                    self.count += 1
                }
                // messages data is ready
                self.isReady = true
            }
    }
    
    /// send message
    func sendChat() {
        // current user id
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "sendChat: Could not find current uid"
            return
        }
        // sending user id
        guard let toId = toUser?.id else {
            self.errorMessage = "sendChat: Could not find recieving user uid"
            return
        }
        
        // message data
        let messageData = [
            "fromId": fromId,
            "toId": toId,
            "text": self.chatText,
            "timestamp": getTime(),
            "time": Date()
        ] as [String : Any]
        
        // save message to current user
        let document = FirebaseManager.shared.firestore.collection("messages")
            .document(fromId).collection(toId).document()
        document.setData(messageData) { error in
            if let error = error {
                self.errorMessage = "sendChat:Fail to send message \(error)"
                return
            }
            // update recent message
            self.recentMessages()
            // reset typed chat text
            self.chatText = ""
            self.count += 1
        }
        
        // save message to recieving user
        let recipientMessageDocument = FirebaseManager.shared.firestore.collection("messages")
            .document(toId).collection(fromId).document()
        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                self.errorMessage = "sendChat:Fail to send message \(error)"
                return
            }
        }
    }
    
    /// update recent message
    private func recentMessages() {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "recentMessages: Could not find current uid"
            return
        }
        // sending user id
        guard let toId = toUser?.id else {
            self.errorMessage = "recentMessages: Could not find recieving user uid"
            return
        }
        
        // update recent message to current user
        let document = FirebaseManager.shared.firestore.collection("recent_messages")
            .document(uid).collection("messages").document(toId)
        document.updateData([
            "text": self.chatText,
            "timestamp": getTime(),
            "time": Date()
        ]) { error in
            if let error = error {
                self.errorMessage = "recentMessages: Fail to update recent message \(error)"
                return
            }
        }
        
        // update recent message to recieving user
        let recieveDocument = FirebaseManager.shared.firestore.collection("recent_messages")
            .document(toId).collection("messages").document(uid)
        recieveDocument.updateData([
            "text": self.chatText,
            "timestamp": getTime(),
            "time": Date()
        ]) { error in
            if let error = error {
                self.errorMessage = "recentMessages: Fail to update recent message \(error)"
                return
            }
        }
    }
    
    // reference: https://mammothinteractive.com/get-current-time-with-swiftui-hacking-swift-5-5-xcode-13-and-ios-15/
    /// handle timestemp
    /// return: formatted time: String
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
}
