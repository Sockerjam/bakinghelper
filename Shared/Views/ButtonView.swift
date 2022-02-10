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
            print("Open Safari")
        } label: {
            Text("Open Safari")
        }
        .foregroundColor(.red)

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
