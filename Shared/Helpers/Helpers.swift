//
//  Helpers.swift
//  BakingHelper
//
//  Created by Niclas Jeppsson on 07/02/2022.
//

import SwiftUI

extension View {

    func animateView(with animation: Animation = Animation.easeIn(duration: 2), apply: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                apply()
            }
        }
    }
}
