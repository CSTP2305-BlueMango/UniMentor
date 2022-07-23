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
            BackButtonView(action: {
                // pop child view to go back to message view
                presentation.wrappedValue.dismiss()
            }).padding(.top, UIScreen.main.bounds.height * 0.008)
            VStack {
                HStack(spacing: UIScreen.main.bounds.width * 0.05) {
                    // LEFT - Image
                    VStack {
                        AsyncImage(url: URL(string: "\(user?.userImage ?? "user_image2")")) {image in image
                            .resizable()
                            .cornerRadius(50)
                            .aspectRatio(contentMode: .fill)
                        }placeholder: {ProgressView()}
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.width * 0.1)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    Text("\(user?.userName ?? "test wefwef")")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                }
                .padding(.trailing, UIScreen.main.bounds.width * 0.1)
                messagesView
                .frame(height: UIScreen.main.bounds.height * 0.82)
            }
            VStack(spacing: 0) {
                Spacer()
                chatBottomBar
                    .background(Color("LightColor"))
                    .shadow(radius: 0)
                    .ignoresSafeArea()
            }
            .shadow(radius: UIScreen.main.bounds.width * 0.01)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .task {
            chatVM.toUser = self.user
            chatVM.fetchMessages()
        }
    }
    
    private var messagesView: some View {
        ScrollView {
            ScrollViewReader { scrollViewProxy in
                VStack {
                    ForEach(chatVM.chatMessages) { message in
                        if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                            MessageBubbleView(message: message.text, time: separateTimeStemp(timestemp: message.timestamp)[1], date: separateTimeStemp(timestemp: message.timestamp)[0], isUserMessage: true)                        }
                        else {
                            MessageBubbleView(message: message.text, time: separateTimeStemp(timestemp: message.timestamp)[1], date: separateTimeStemp(timestemp: message.timestamp)[0], isUserMessage: false)
                        }
                    }
                    HStack{ Spacer() }
                    .frame(height: UIScreen.main.bounds.height * 0.06)
                    .id("End")
                }
                .padding(.top, UIScreen.main.bounds.height * 0.01)
                .onReceive(chatVM.$count) { _ in
                    withAnimation(.easeOut(duration: 0.5)) {
                        scrollViewProxy.scrollTo("End", anchor: .bottom)
                    }
                }
            }
            
        }
        .background(Color("ChatColor"))
    }

    private var chatBottomBar: some View {
        HStack(spacing: UIScreen.main.bounds.width * 0.04) {
            ZStack {
                DescriptionPlaceholder()
                TextEditor(text: $chatVM.chatText)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                    .opacity(chatVM.chatText.isEmpty ? 0.5 : 1)
            }
            .padding(.leading)
            .padding(.top, UIScreen.main.bounds.height * 0.005)
            .frame(height: UIScreen.main.bounds.height * 0.05)

            Button {
                if !chatVM.chatText.isEmpty {
                    chatVM.sendChat()
                }
            } label: {
                Image(systemName: "arrow.up.circle")
                    .foregroundColor(Color("DarkColor"))
                    .font(.system(size: UIScreen.main.bounds.width * 0.07))
                    .opacity(chatVM.chatText.isEmpty ? 0.5 : 1)
            }
            .padding(.trailing, UIScreen.main.bounds.width * 0.02)
        }
        .background(.white)
        .cornerRadius(UIScreen.main.bounds.width * 0.07)
        .padding(.horizontal)
        .padding(.vertical, UIScreen.main.bounds.height * 0.01)
    }
}

private struct DescriptionPlaceholder: View {
    var body: some View {
        HStack {
            Text("Enter Message")
                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                .padding(.leading, UIScreen.main.bounds.width * 0.01)
                .padding(.top, -UIScreen.main.bounds.width * 0.01)
            Spacer()
        }
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
