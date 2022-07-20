//
//  MessageChatView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// display messages between users
struct MessageChatView: View {
    @Environment(\.presentationMode) var presentation
    
    @State var user: MessageUser?
    
    
    // @ObservedObject var userVM = UserViewModel()
    @ObservedObject var chatVM = ChatViewModel()
    

    @State var chatText = ""
    
    

    var body: some View {
        ZStack(alignment: .top) {
//            if !chatVM.isReady {
//                Text("not ready")
//            }
//            else {
                // Back Button
                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                            .font(.system(size: UIScreen.main.bounds.width * 0.06))
                    }
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.9)
                .padding(.top, UIScreen.main.bounds.height * 0.008)
                VStack {
                    HStack(spacing: UIScreen.main.bounds.width * 0.05) {
                        // LEFT - Image
                        VStack {
                            Image(user?.userImage ?? "user_image2")
                                .resizable()
                                .cornerRadius(50)
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.width * 0.1)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        Text("\(user?.userName ?? "test wefwef")")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                    }
                    .padding(.trailing, UIScreen.main.bounds.width * 0.1)
                    // Text(chatVM.chatMessages[0].text)
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
            // }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//        .task {
//            print(self.user)
//            chatVM.toUser = self.user
//            chatVM.fetchMessages()
//        }
    }
    
    private var messagesView: some View {
        ScrollView {
            ScrollViewReader { scrollViewProxy in
                VStack {
                    ForEach(chatVM.chatMessages) { message in
                        if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Text("\(message.timestamp)")
                                        .foregroundColor(Color("DarkColor"))
                                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                                }
                                HStack {
                                    Text(message.text)
                                        .foregroundColor(.black)
                                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                                }
                                .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(.gray).opacity(0.3), radius: 5, x: 0, y: 0))
                            }
                            .padding(.horizontal)
                            .padding(.top, UIScreen.main.bounds.width * 0.02)
                        }
                        else {
                            HStack {
                                
                                HStack {
                                    Text(message.text)
                                        .foregroundColor(.black)
                                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                                }
                                .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(.gray).opacity(0.3), radius: 5, x: 0, y: 0))
                                VStack {
                                    Spacer()
                                    Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                                        .foregroundColor(Color("DarkColor"))
                                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top, UIScreen.main.bounds.width * 0.02)
                        }
                    }
                    HStack{ Spacer() }
                    .frame(height: UIScreen.main.bounds.height * 0.06)
                    .id("End")
                }
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
                    // TODO: send message
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
