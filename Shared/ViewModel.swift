//
//  ViewModel.swift
//  BakingHelper
//
//  Created by Niclas Jeppsson on 09/02/2022.
//

import Foundation
import SwiftUI

protocol CardLoader {
    var tutorialCards: [Card] { get set }
    func reloadCards()
}

class ViewModel: CardLoader, ObservableObject {
    
    @Published var tutorialCards: [Card] = [
        Card(id: 0, offset: 0, image: "orange", step: "Step 1", description: "Open Safari"),
        Card(id: 1, offset: 0, image: "green", step: "Step 2", description: "Highlight Ingridients"),
        Card(id: 2, offset: 0, image: "pink", step: "Step 3", description: "Open Extension")]

    func reloadCards() {
        tutorialCards = [
            Card(id: 0, offset: 0, image: "orange", step: "Step 1", description: "Open Safari"),
            Card(id: 1, offset: 0, image: "green", step: "Step 2", description: "Highlight Ingridients"),
            Card(id: 2, offset: 0, image: "pink", step: "Step 3", description: "Open Extension")]
    }
}
