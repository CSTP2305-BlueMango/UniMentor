//
//  DatePickerView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-11.
//

import SwiftUI

// reference: https://stackoverflow.com/questions/63795080/how-do-i-create-a-datepicker-in-swiftui-that-only-select-years-and-i-want-this-t
/// date picker input field
/// param: placeholder, month, year, error message
struct DatePickerView: View {
    /// picker placeholder
    var placholder: String
    /// date picker month
    @Binding var month: String
    /// date picker year
    @Binding var year: String
    /// error message
    @Binding var errorMessage: String?

    /// array of years selection
    private let years = Array((getYear(selectedYear: Date()) - 15)...getYear(selectedYear: Date()))
    /// array of months selection
    private let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    /// formats int into string
    private let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.usesGroupingSeparator = false
        return nf
    }()

    /// convert year int to string
    func yearString(at index: Int) -> String {
        let selectedYear = years[index]
        year = "\(years[index])"
        return numberFormatter.string(for: selectedYear) ?? selectedYear.description
    }
    
    /// convert month int to string
    func monthString(at index: Int) -> String {
        let selectedMonth = months[index]
        month = "\(months[index])"
        return numberFormatter.string(for: selectedMonth) ?? selectedMonth.description
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // title & error message
            HStack(alignment: .center) {
                // input title
                VStack(alignment: .leading) {
                    Text("Start Date")
                        .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        .padding(.leading, UIScreen.main.bounds.width * 0.03)
                        .foregroundColor(Color("DarkColor"))
                }.frame(width: UIScreen.main.bounds.width * 0.34, height: UIScreen.main.bounds.height * 0.02, alignment: .leading)
                Spacer()
                // error message
                VStack(alignment: .trailing) {
                    if let errorMessage = errorMessage {
                        Text(errorMessage).font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04)).foregroundColor(Color("ErrorColor")).frame(width: UIScreen.main.bounds.width * 0.52, alignment: .trailing)
                    }
                }.frame(height: UIScreen.main.bounds.height * 0.015)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.02)
            }//: title & error message
            // Input Field
             HStack(spacing: UIScreen.main.bounds.width * 0.05) {
                // Input Icon
                Image(systemName: "calendar")
                    .foregroundColor(Color(red: 0.835,green: 0.835,blue: 0.844))
                    .frame(width: UIScreen.main.bounds.width * 0.05)
                // Selected inputs
                HStack {
                    Text(month).frame(width: UIScreen.main.bounds.width * 0.1)
                    Text(year).frame(width: UIScreen.main.bounds.width * 0.1)
                }.frame(width: UIScreen.main.bounds.width * 0.2)
                Spacer()
                // Select month & year
                // Month selection
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
                // Year selection
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
                }.padding(.trailing, UIScreen.main.bounds.width * 0.01)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
            .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.1)
        //: VSTACK
    }
}

struct DatePicker_Preview: View {
    @State var month = ""
    @State var year = ""
    @State var error: String? = ""
    var body: some View {
        DatePickerView(placholder: "", month: $month, year: $year, errorMessage: $error)
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
