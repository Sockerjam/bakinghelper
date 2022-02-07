//
//  ContentView.swift
//  Shared
//
//  Created by Niclas Jeppsson on 22/12/2021.
//

import SwiftUI

struct ContentView: View {

    @State var startAnimation: Bool = false

    var body: some View {
        VStack {
            if startAnimation {
                HeadLineView()
                    .padding(.vertical)
                AppInfoView()
            }
        } .animateView {
            startAnimation = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
