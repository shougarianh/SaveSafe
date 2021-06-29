//
//  Style.swift
//  SaveSafe
//
//  Created by Haik Shougarian on 6/16/21.
//

import Foundation
import UIKit

class Style {
    
    static func styleHollowButton(_ button:UIButton)
    {
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 12.5
        button.tintColor = .white
    }
}
