//
//  ContentView.swift
//  Flashzilla
//
//  Created by Subhrajyoti Chakraborty on 20/09/20.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { (value) in
                self.offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    self.isDragging = false
                    self.offset = CGSize.zero
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    self.isDragging = true
                }
            }
        
        let combine = pressGesture.sequenced(before: dragGesture)
        
        
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combine)
    }
}
    

//struct ContentView: View {
//        @State private var currentAmount: CGFloat = 0
//        @State private var finalAmount: CGFloat = 1
//
//    @State private var currentAmount: Angle = .degrees(0)
//    @State private var finalAmount: Angle = .degrees(0)
//
//
//    var body: some View {
//                Text("Hello, world!")
//                    .padding()
//                    .onTapGesture(count: 2, perform: {
//                        print("Double tap")
//                    })
//                Text("Hello, World!")
//                    .onLongPressGesture(minimumDuration: 2, pressing: { inProgress in
//                        print("In progress: \(inProgress)!")
//                    }) {
//                        print("Long pressed!")
//                    }
//
//
//                Text("Hello, World!")
//                    .scaleEffect(finalAmount + currentAmount)
//                    .gesture(
//                        MagnificationGesture()
//                            .onChanged { (amount) in
//                                self.currentAmount = amount - 1
//                            }
//                            .onEnded { (amount) in
//                                self.finalAmount += self.currentAmount
//                                self.currentAmount = 0
//                            }
//                    )
//
//
//
//                Text("Hello, World!")
//                    .rotationEffect(currentAmount + finalAmount)
//                    .gesture(
//                        RotationGesture()
//                            .onChanged { angle in
//                                self.currentAmount = angle
//                            }
//                            .onEnded { angle in
//                                self.finalAmount += self.currentAmount
//                                self.currentAmount = .degrees(0)
//                            }
//                    )
//
//
//
//        VStack {
//            Text("Hello World")
//                .onTapGesture {
//                    print("Child Tapped!!")
//                }
//        }
//                .highPriorityGesture(
//                    TapGesture()
//                        .onEnded({ _ in
//                            print("Parent Tapped!!")
//                        })
//                )
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded({ _ in
//                    print("Parent Tapped!!")
//                })
//        )
//
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
