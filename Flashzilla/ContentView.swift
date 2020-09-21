//
//  ContentView.swift
//  Flashzilla
//
//  Created by Subhrajyoti Chakraborty on 20/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello world")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    print("Moving to the background!")
                })
            
            Text("Hello World Two")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                    print("Moving back to the foreground!")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
