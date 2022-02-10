//
//  CardsView.swift
//  BakingHelper
//
//  Created by Niclas Jeppsson on 10/02/2022.
//

import SwiftUI

struct CardsView: View {

    @ObservedObject var cardLoader: ViewModel

    var body: some View {
        ZStack {

                ForEach(cardLoader.tutorialCards.reversed()){ card in

                    HStack {

                        Image(card.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 500 - CGFloat(card.id * 30))
                            .cornerRadius(15)
                            .offset(x: CGFloat(card.id * 30))
                        Spacer()
                    }
                    .padding(.horizontal, 25)
                    .contentShape(Rectangle())
                    .offset(x: card.offset)
                    .gesture(DragGesture().onChanged({ value in

                        withAnimation {

                            cardLoader.tutorialCards[0].offset = value.translation.width
                        }
                    }).onEnded({ value in

                        withAnimation(Animation.easeOut(duration: 0.5)) {

                            if value.translation.width < 0 {

                                cardLoader.tutorialCards.removeFirst()

                            } else {
                                cardLoader.tutorialCards[0].offset = 0
                            }
                        }

                        if cardLoader.tutorialCards.isEmpty {

                            withAnimation(Animation.easeIn(duration: 1)) {
                                cardLoader.reloadCards()
                            }
                        }
                    }))
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(cardLoader: ViewModel())
    }
}
