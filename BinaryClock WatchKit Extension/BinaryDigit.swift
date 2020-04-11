//
//  BinaryDigit.swift
//  BinaryClock WatchKit Extension
//
//  Created by Corey Brummel-Smith on 4/10/20.
//  Copyright © 2020 Corey Brummel-Smith. All rights reserved.
//

import SwiftUI

//func getBitColor(number: Int, bitPlace: Int) -> Color {
//    let bit = (number >> (numBits-1 - bitPlace)) & 1
//    return bit == 1 ? Color.white : Color.black
//}

struct BinaryDigit: View {

    @Binding var value:Int
    private let numComponentenBits: Int = 6
    
    var body: some View {
        VStack{
            ForEach(0..<self.numComponentenBits) {
                bit in Circle()
                    .foregroundColor(
                        getBitColor(isOn: isBitOn(number:self.value,numBits:self.numComponentenBits, bitPlace:bit)))
                .shadow(color: .blue, radius: 4, x: 0, y: 0)
            }
            //Text("\(self.value)")
        }
        //VStack{
        //    ForEach(0..<numBits) { bit in Text("\(getBit(number: self.value, //bitPlace: bit))") }
        //}
    }
}

struct BinaryDigit_Previews: PreviewProvider {

    static var previews: some View {
        ZStack{
            Rectangle().foregroundColor(.gray).edgesIgnoringSafeArea(.all)
            BinaryDigit(value: Binding.constant(13))
        }
    }
}
