//
//  ClockColon.swift
//  BinaryClock WatchKit Extension
//
//  Created by Corey Brummel-Smith on 4/11/20.
//  Copyright © 2020 Corey Brummel-Smith. All rights reserved.
//

import SwiftUI

struct ClockColon: View {
    
    private let colonScale: CGFloat = 0.65
    
    var body: some View {
        VStack {
            Circle().scale(colonScale)
            Circle().scale(colonScale)
        }.foregroundColor(.black).padding([.top, .bottom], 25)
    }
}

struct ClockColon_Previews: PreviewProvider {
    static var previews: some View {
        ClockColon()
    }
}
