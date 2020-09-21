//
//  ContentView.swift
//  Flashzilla
//
//  Created by Subhrajyoti Chakraborty on 20/09/20.
//

import SwiftUI

struct ContentView: View {
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text("Hello world")
            .onReceive(timer, perform: { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                self.counter += 1
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
