//
//  ContentView.swift
//  Flashzilla
//
//  Created by Subhrajyoti Chakraborty on 20/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    @State private var scale: CGFloat = 1
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .scaleEffect(scale)
                .onTapGesture {
                    withOptionalAnimation {
                        self.scale *= 1.5
                    }
                }
            
            Text("Hello, World!")
                .padding()
                .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
                .foregroundColor(Color.white)
                .clipShape(Capsule())
            
            HStack {
                if differentiateWithoutColor {
                    Image(systemName: "checkmark.circle")
                }
                
                Text("Success")
            }
            .padding()
            .background(differentiateWithoutColor ? Color.black : Color.green)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
