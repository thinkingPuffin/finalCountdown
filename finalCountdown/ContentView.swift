//
//  ContentView.swift
//  finalCountdown
//
//  Created by Félix MIL on 27/07/2022.
//  Copyright © 2022 Félix MIL. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @State private var startDate = Date()
    
    var body: some View {
        VStack {
            DatePicker("",
                       selection: $startDate,
                       displayedComponents: [.date])
            Spacer()
            Text("Now")
            Text("\(self.toString(dateDate: Date()))")
            Spacer()
            Text("Difference:")
            Text("\(self.getDiff(then: startDate, now: Date()))" + " days")
            Spacer()
            
        }
        
    }
    
    func toDate(dateString: String) -> Date {
        let dateFormater = DateFormatter()
        //dateFormater.locale = Locale(identifier: "fr_FR_POSIX")
        dateFormater.dateFormat = "yyyy-MM-dd"
        //dateFormater.timeZone = TimeZone(abbreviation: "GMT+00:00")
        return dateFormater.date(from: dateString)!
    }
    
    func toString(dateDate: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.string(from: dateDate)
    }
    
    func getDiff(then: Date, now: Date) -> Int {
        let calendar = Calendar.current

        // Replace the hour (time) of both dates with 00:00
        let then = calendar.startOfDay(for: then)
        let now = calendar.startOfDay(for: now)

        let components = calendar.dateComponents([.day], from: then, to: now)
        return components.day!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    


