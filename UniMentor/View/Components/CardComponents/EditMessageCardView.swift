//
//  EditMessageCardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-16.
//

import SwiftUI

struct EditMessageCardView: View {
    
    /// card selected state
    @State var isOn1: Bool = false
    
    @State var user: MessageUser
    
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    var body: some View {
        Button(action: {
            isOn1 = !isOn1
            // add and remove from MessageUser list
            if isOn1 {
                if !LinkUsersViewModel.selectedMessageUsers.contains(where: { $0.id == user.id }) {
                    LinkUsersViewModel.selectedMessageUsers.append(user)
                }
            } else {
                LinkUsersViewModel.selectedMessageUsers.removeAll(where: { $0.id == user.id } )
            }
            print("\(LinkUsersViewModel.selectedMessageUsers)")
        }) {
            HStack(spacing: UIScreen.main.bounds.width * 0.04) {
                // reference: https://swiftuirecipes.com/blog/custom-toggle-checkbox-in-swiftui
                HStack {
                    Image(systemName: isOn1 ? "checkmark.circle.fill" : "circle")
                      .imageScale(.large)
                      .foregroundColor(.blue)
                }
                
                MessageCardView(user: user)
                
            }//: HSTACK

        }
        .frame(width: UIScreen.main.bounds.width * 1).padding(.leading, UIScreen.main.bounds.width * 0.12)
        //: Button

    }
}

struct EditMessageCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditMessageCardView(
            user: MessageUser(data: ["id": "", "userName": "", "userImage": "", "fromId": "", "text": "", "timestamp": ""])
        )
    }
}
