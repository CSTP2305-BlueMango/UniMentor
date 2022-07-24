//
//  DatePickerView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-11.
//

import SwiftUI

// reference: https://stackoverflow.com/questions/63795080/how-do-i-create-a-datepicker-in-swiftui-that-only-select-years-and-i-want-this-t
/// date picker input field
struct DatePickerView: View {
    var placholder: String
    @Binding var month: String
    @Binding var year: String
    
    private let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.usesGroupingSeparator = false
        return nf
    }()

    @State private var selectedYearIndex = getYear(selectedYear: Date())
    private let years = Array((getYear(selectedYear: Date()) - 15)...getYear(selectedYear: Date()))
    
    @State private var selectedMonthIndex = 0
    private let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    @State var selectedDate = "\(getYear(selectedYear: Date()))"
    @State var selectecMonth = "Jan"

    func yearString(at index: Int) -> String {
        let selectedYear = years[index]
        year = "\(years[index])"
        return numberFormatter.string(for: selectedYear) ?? selectedYear.description
    }
    
    func monthString(at index: Int) -> String {
        let selectedMonth = months[index]
        month = "\(months[index])"
        return numberFormatter.string(for: selectedMonth) ?? selectedMonth.description
    }
    
    @State var monthSelect = false
    
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
                    .foregroundColor(Color(red: 0.835,green: 0.835,blue: 0.844))
                    .frame(width: UIScreen.main.bounds.width * 0.05)
                HStack {
                    Text(month).frame(width: UIScreen.main.bounds.width * 0.1)
                    Text(year).frame(width: UIScreen.main.bounds.width * 0.1)
                }.frame(width: UIScreen.main.bounds.width * 0.2)
                Spacer()
                Menu {
                    ForEach(months.indices) { monthIndex in
                        Button(action: {
                            month = "\(self.monthString(at: monthIndex))"
                        }) {
                            Text("\(self.monthString(at: monthIndex))")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                        }
                    }
                } label: {
                    Text("Month")
                        .foregroundColor(.black)
                        .padding(UIScreen.main.bounds.width * 0.02)
                        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                        .cornerRadius(UIScreen.main.bounds.width * 0.02)
                }
                
                Menu {
                    ForEach(years.indices) { yearIndex in
                        Button(action: {
                            year = "\(self.yearString(at: yearIndex))"
                        }) {
                            Text("\(self.yearString(at: yearIndex))")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                        }
                    }
                } label: {
                    Text("Year")
                        .foregroundColor(.black)
                        .padding(UIScreen.main.bounds.width * 0.02)
                        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                        .cornerRadius(UIScreen.main.bounds.width * 0.02)
                }
                .padding(.trailing, UIScreen.main.bounds.width * 0.01)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
            .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        }
    }
}

struct DatePicker_Preview: View {
    @State var month = ""
    @State var year = ""
    var body: some View {
        DatePickerView(placholder: "Enter date", month: $month, year: $year)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_Preview()
    }
}

/// get year from provided date
/// param: Date
func getYear(selectedYear: Date) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    let yearString = dateFormatter.string(from: selectedYear)
    return Int(yearString) ?? 0
}
