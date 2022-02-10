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
            Text("The Baking Helper")
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .padding(.vertical, 30)
            CardsView(cardLoader: cardLoader)
                .padding(.vertical, 40)
            Spacer()
            ButtonView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cardLoader: ViewModel())
    }
}
