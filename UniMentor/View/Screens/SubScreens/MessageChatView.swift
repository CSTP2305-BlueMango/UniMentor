//
//  MessageChatView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// display messages between users
/// param: messageUser
struct MessageChatView: View {
    /// messageUser model
    @State var user: MessageUser?
    /// chat text
    @State var chatText = ""
    
    /// chat view model object
    @ObservedObject var chatVM = ChatViewModel()
    
    /// view presentation mode
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack(alignment: .top) {
            // Back button
            BackButtonView(action: {
                // pop child view to go back to message view
                presentation.wrappedValue.dismiss()
            }).padding(.top, UIScreen.main.bounds.height * 0.008)
            // MAIN
            VStack {
                HStack(spacing: UIScreen.main.bounds.width * 0.05) {
                    // User Image
                    VStack {
                        AsyncImage(url: URL(string: "\(user?.userImage ?? "user_image2")")) {image in image
                            .resizable()
                            .cornerRadius(50)
                            .aspectRatio(contentMode: .fill)
                        }placeholder: {
                            Image("")
                                 .resizable()
                                 .cornerRadius(50)
                                 .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                 .aspectRatio(contentMode: .fill)
                                 .clipShape(Circle())
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.width * 0.1)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    // User Name
                    Text("\(user?.userName ?? "test wefwef")")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                }.padding(.trailing, UIScreen.main.bounds.width * 0.1)
                // Messages
                messagesView
                    .frame(height: UIScreen.main.bounds.height * 0.82)
            } //: MAIN
            // Input
            VStack(spacing: 0) {
                Spacer()
                // Message input field
                chatBottomBar
                    .background(Color("LightColor"))
                    .shadow(radius: 0)
                    .ignoresSafeArea()
            }.shadow(radius: UIScreen.main.bounds.width * 0.01)
            //: Input
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .task {
            // set user and get all messages
            chatVM.toUser = self.user
            chatVM.fetchMessages()
        }
    }
    
    /// messages view
    private var messagesView: some View {
        ScrollView {
            ScrollViewReader { scrollViewProxy in
                // Messages
                VStack {
                    // loop through all messages
                    ForEach(chatVM.chatMessages) { message in
                        // sent messages
                        if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                            MessageBubbleView(message: message.text, time: separateTimeStemp(timestemp: message.timestamp)[1], date: separateTimeStemp(timestemp: message.timestamp)[0], isUserMessage: true)
                        }
                        // recieved messages
                        else {
                            MessageBubbleView(message: message.text, time: separateTimeStemp(timestemp: message.timestamp)[1], date: separateTimeStemp(timestemp: message.timestamp)[0], isUserMessage: false)
                        }
                    }
                    HStack{ Spacer() }
                    .frame(height: UIScreen.main.bounds.height * 0.06)
                    .id("End")
                }.padding(.top, UIScreen.main.bounds.height * 0.01)
                // scroll to buttom
                .onReceive(chatVM.$count) { _ in
                    withAnimation(.easeOut(duration: 0.5)) {
                        scrollViewProxy.scrollTo("End", anchor: .bottom)
                    }
                }
            }
        }.background(Color("ChatColor"))
        //: ScrollView
    }

    /// message input field
    private var chatBottomBar: some View {
        // FOOTER
        HStack(spacing: UIScreen.main.bounds.width * 0.04) {
            // Input field
            ZStack {
                // Placeholder
                HStack {
                    Text("Enter Message")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        .padding(.leading, UIScreen.main.bounds.width * 0.01)
                        .padding(.top, -UIScreen.main.bounds.width * 0.01)
                    Spacer()
                }
                // Input
                TextEditor(text: $chatVM.chatText)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                    .opacity(chatVM.chatText.isEmpty ? 0.5 : 1)
            }
            .padding(.leading)
            .padding(.top, UIScreen.main.bounds.height * 0.005)
            .frame(height: UIScreen.main.bounds.height * 0.05)
            // Send Button
            Button {
                if !chatVM.chatText.isEmpty {
                    chatVM.sendChat()
                }
            } label: {
                Image(systemName: "arrow.up.circle")
                    .foregroundColor(Color("DarkColor"))
                    .font(.system(size: UIScreen.main.bounds.width * 0.07))
                    .opacity(chatVM.chatText.isEmpty ? 0.5 : 1)
            }.padding(.trailing, UIScreen.main.bounds.width * 0.02)
        }
        .background(.white)
        .cornerRadius(UIScreen.main.bounds.width * 0.07)
        .padding(.horizontal)
        .padding(.vertical, UIScreen.main.bounds.height * 0.01)
        //: FOOTER
    }
}

struct MessageChatViewPreviewView: View {
    @State var isMatchedUserMessage: Bool = false
    var body: some View {
        MessageChatView()
    }
}

struct MessageChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageChatViewPreviewView()
        }
    }
}

/// format timestemp of message
/// param: timestemp
/// return: array of date and time
func separateTimeStemp(timestemp: String) -> [String] {
    if timestemp != "" {
        let result = timestemp.components(separatedBy: " ")
        let date = "\(result[0]) \(result[1]) \(result[2])"
        let time = "\(result[4]) \(result[5])"
        return [date, time]
    }
    else {
        return ["", ""]
    }
}
