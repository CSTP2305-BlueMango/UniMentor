//
//  MatchedView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct MatchedView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This is the MATCHED VIEW")
                VStack(alignment: .center) {
                    NavigationLink(destination: MatchedProfileView()) {
                        Text("To MATCHED profile")
                    }
                }
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
