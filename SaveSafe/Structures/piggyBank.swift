//
//  piggyBank.swift
//  SaveSafe
//
//  Created by Haik Shougarian on 6/28/21.
//

import SwiftUI

struct piggyBank {
    var title: String
    var contributers: [String]
    var goal: Double
    var purpose: String
    
    init(title: String, contributers: [String], goal: Double, purpose: String) {
           self.title = title
           self.contributers = contributers
           self.goal = goal
           self.purpose = purpose
       }
}

extension piggyBank {
    static var data: piggyBank{
        piggyBank(title: "Friends", contributers: ["John", "Jane"], goal: 15.0, purpose: "Vacation")
    }
}

extension piggyBank {
    struct Data {
        var title: String = ""
        var contributers: [String] = []
        var goal: Double = 1.0
        var purpose: String = ""
    }
    var data: Data {
        return Data(title: title, contributers: contributers, goal: goal, purpose: purpose)
    }
}
