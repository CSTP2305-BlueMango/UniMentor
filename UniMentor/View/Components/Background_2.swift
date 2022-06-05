//
//  Background_2.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct Background_2: View {
    var body: some View {
        ZStack {
            Color(red: 0.6235, green: 0.5450, blue: 0.4235)
                .ignoresSafeArea()
        }
        .frame(height: 900, alignment: .center)
        .mask(Parallelogram(depth: 130))
    }
}

struct Background_2_Previews: PreviewProvider {
    static var previews: some View {
        Background_2()
    }
}
