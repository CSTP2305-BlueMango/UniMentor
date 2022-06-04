//
//  RequestsView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct RequestsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This is the REQUESTS VIEW")
                VStack(alignment: .center) {
                    NavigationLink(destination: RequestsProfileView()) {
                        Text("To REQUESTS profile")
                    }
                }
            }
        }
    }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}
