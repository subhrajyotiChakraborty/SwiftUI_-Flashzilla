//
//  Card.swift
//  Flashzilla
//
//  Created by Subhrajyoti Chakraborty on 23/09/20.
//

import Foundation


struct Card {
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
