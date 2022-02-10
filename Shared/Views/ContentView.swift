//
//  ContentView.swift
//  Shared
//
//  Created by Niclas Jeppsson on 22/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cardLoader: ViewModel
    
    var body: some View {
        VStack {
            CardsView(cardLoader: cardLoader)
            ButtonView()
        }

    }
    //TODO - Implement width to work for multiple screen sizes
//    private func calculateWidth() -> CGFloat {
//        let screenWidth = UIScreen.main.bounds.width - 30
//        let width = screenWidth - (2 * 30)
//        print(width)
//        return width
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cardLoader: ViewModel())
    }
}
