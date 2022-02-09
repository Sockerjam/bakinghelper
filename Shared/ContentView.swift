//
//  ContentView.swift
//  Shared
//
//  Created by Niclas Jeppsson on 22/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            
                ForEach(viewModel.tutorialCards.reversed()){ card in
                    
                    HStack {
                        
                        Image(card.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 500)
                            .foregroundColor(card.id == 1 ? .red : .green)
                            .cornerRadius(15)
                            .offset(x: CGFloat(card.id * 30))
                        Spacer()
                    }
                    .padding(.horizontal, 25)
            }
        }
    }
    
    private func calculateWidth() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width - 30
        let width = screenWidth - (2 * 30)
        print(width)
        return width
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
