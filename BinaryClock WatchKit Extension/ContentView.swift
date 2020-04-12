//
//  ContentView.swift
//  BinaryClock WatchKit Extension
//
//  Created by Corey Brummel-Smith on 4/10/20.
//  Copyright © 2020 Corey Brummel-Smith. All rights reserved.
//

// TODO: On top: month day (..... .....)
//       On bot: weekday (....... or .... non binary vs binary)

import SwiftUI

func getTimeComponent(component: Calendar.Component, date: Date) -> Int {
    let time = Calendar.current
    return time.component(component, from: date)
}

struct CurrentTime {
    var month: Int = 7
    var day: Int = 28
    var weekday: Int = 2
    var hour:Int   = 4
    var minute:Int = 20
    var second:Int = 37
}

struct ContentView: View {
    
    @State private var backColor = Color(hue: 0,saturation: 0,brightness: 200/255)
    @State private var currentDate = Date()
    @State private var currentTime = CurrentTime()
    @State private var showDate: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    func update(date: Date) {
        self.currentDate = date
        self.currentTime.month
            = getTimeComponent(component: .month,   date: self.currentDate)
        self.currentTime.day
            = getTimeComponent(component: .day,     date: self.currentDate)
        self.currentTime.weekday
            = getTimeComponent(component: .weekday, date: self.currentDate)
        self.currentTime.hour
            = getTimeComponent(component: .hour,    date: self.currentDate)
        self.currentTime.minute
            = getTimeComponent(component: .minute,  date: self.currentDate)
        self.currentTime.second
            = getTimeComponent(component: .second,  date: self.currentDate)
    }
    
    var body: some View {
        ZStack{
            //Rectangle().foregroundColor(backColor).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(backColor).cornerRadius(10, antialiased: true)
            VStack {
                if showDate {
                    BinaryDate(month: $currentTime.month, day: $currentTime.day).padding()
                    Spacer()
                }
                HStack {
                    BinaryDigit(value: $currentTime.hour)
                    //ClockColon()
                    BinaryDigit(value: $currentTime.minute)
                    //ClockColon()
                    BinaryDigit(value: $currentTime.second)
                }.frame(width: 150, height: 100, alignment: .center)
                if showDate {
                    Spacer()
                    WeekdayView(weekday: $currentTime.weekday).padding()
                }
                //Text("\(currentTime.month)/\(currentTime.day)")
                //Text("\(currentTime.weekday)")
            }.onTapGesture(count: 3){
                self.showDate.toggle()
            }

        }.onReceive(timer, perform: {input in self.update(date: input)})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
