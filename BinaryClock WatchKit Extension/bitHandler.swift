//
//  bitHandler.swift
//  BinaryClock WatchKit Extension
//
//  Created by Corey Brummel-Smith on 4/11/20.
//  Copyright © 2020 Corey Brummel-Smith. All rights reserved.
//

import Foundation
import SwiftUI

func isBitOn(number: Int, numBits: Int, bitPlace: Int) -> Bool {
    let bit = (number >> (numBits-1 - bitPlace)) & 1
    return bit == 1 ? true : false
}

func getBitColor(isOn: Bool) -> Color {
    return isOn ? Color.white : Color.black
}

func getBitShadow(isOn: Bool) -> Color {
    return isOn ? Color.white : Color.black
}
    