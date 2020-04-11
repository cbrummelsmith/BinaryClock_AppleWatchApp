//
//  BinaryDate.swift
//  BinaryClock WatchKit Extension
//
//  Created by Corey Brummel-Smith on 4/11/20.
//  Copyright © 2020 Corey Brummel-Smith. All rights reserved.
//

import SwiftUI

struct BinaryDate: View {
    
    @Binding var month:Int
    @Binding var day:Int
    private let numMonthBits:Int = 5
    private let numDayBits:Int = 5
    
    var body: some View {
        HStack{
            HStack{
                ForEach(0..<self.numMonthBits) {
                    bit in Circle()
                        .foregroundColor(getBitColor(isOn: isBitOn(number:self.month, numBits:self.numMonthBits, bitPlace:bit)))
                }
            }
            Spacer()
            Spacer()
            Spacer()
            HStack{
                ForEach(0..<self.numDayBits) {
                    bit in Circle()
                        .foregroundColor(
                            getBitColor(isOn: isBitOn(number:self.day, numBits:self.numDayBits, bitPlace:bit))
                        )
                }
            }
        }
    }
}

struct BinaryDate_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Rectangle().foregroundColor(.gray).edgesIgnoringSafeArea(.all)
            BinaryDate(month: Binding.constant(7), day: Binding.constant(28))
        }
    }
}
