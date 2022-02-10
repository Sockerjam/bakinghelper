//
//  ButtonView.swift
//  BakingHelper
//
//  Created by Niclas Jeppsson on 10/02/2022.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            guard let url = URL(string: "http://apple.com") else { assertionFailure(); return }
            UIApplication.shared.open(url)

        } label: {
            Label("Open Safari", systemImage: "network")
                .font(.system(size: 14, weight: .medium, design: .monospaced))
                .frame(height: 30)
                
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(.black)
        .foregroundColor(.white)

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
