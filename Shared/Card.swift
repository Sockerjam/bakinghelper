//
//  Model.swift
//  BakingHelper
//
//  Created by Niclas Jeppsson on 09/02/2022.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    
    var id: Int
    var offset: CGFloat
    let image: String
    let step: String
    let description: String
    
}
