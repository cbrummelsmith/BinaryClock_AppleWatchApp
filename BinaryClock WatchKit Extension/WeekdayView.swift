//
//  WeekdayView.swift
//  BinaryClock WatchKit Extension
//
//  Created by Corey Brummel-Smith on 4/11/20.
//  Copyright © 2020 Corey Brummel-Smith. All rights reserved.
//

import SwiftUI

struct WeekdayView: View {
    @Binding var weekday: Int
    @State private var binaryWeekdayView: Bool = false
    private let numWeekdays: Int = 7
    private let numWeekdayBits: Int = 4
    
    var body: some View {
        
        VStack{
            if self.binaryWeekdayView { // Show weekday as binary value
                HStack{
                    ForEach (0 ..< self.numWeekdayBits) { bit in
                        Circle().foregroundColor(
                            getBitColor(isOn: isBitOn(number:self.weekday, numBits:self.numWeekdayBits, bitPlace:bit))
                        )
                    }
                }
            }
            else { // Light up 1 of 7 circles to show weekday
                HStack{
                    ForEach (0 ..< self.numWeekdays) { index in
                        Circle().foregroundColor( index == self.weekday-1 ? .white : .black )
                    }
                }
            }
        }
    }
}

struct WeekdayView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Rectangle().foregroundColor(.gray).edgesIgnoringSafeArea(.all)
            WeekdayView(weekday: Binding.constant(3))
        }
    }
}
