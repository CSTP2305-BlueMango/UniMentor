//
//  DatePickerView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-11.
//

import SwiftUI

struct DatePickerView: View {
    var placholder: String
    @Binding var date: Date
    var body: some View {
        VStack(alignment: .leading) {
         VStack(alignment: .leading) {
             Text("Start date")
                 .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                 .padding(.leading, UIScreen.main.bounds.width * 0.03)
                 .foregroundColor(Color("DarkColor"))
         }.frame(width: UIScreen.main.bounds.width * 0.34, height: UIScreen.main.bounds.height * 0.02, alignment: .leading)
            HStack(spacing: UIScreen.main.bounds.width * 0.05) {
             Image(systemName: "calendar")
                 .foregroundColor(
                     Color(
                         red: 0.835,
                         green: 0.835,
                         blue: 0.844))
                 .frame(width: UIScreen.main.bounds.width * 0.05)
             // Text(placholder)
             // Spacer()
             DatePicker("", selection: $date, displayedComponents: .date)
                 .labelsHidden()
         }
         .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
         .font(
             Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045)
         )
         .foregroundColor(
             Color(
                 red: 0.835,
                 green: 0.835,
                 blue: 0.844))
         .padding()
         .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
         .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        }
    }
}

struct DatePicker_Preview: View {
    @State var wakeup = Date.now
    var body: some View {
        DatePickerView(placholder: "Enter date",date: $wakeup)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_Preview()
    }
}
