//
//  AppInfoView.swift
//  BakingHelper
//
//  Created by Niclas Jeppsson on 07/02/2022.
//

import SwiftUI

struct AppInfoView: View {
    
    var body: some View {
        VStack {
                Text("Follow These Steps To Use Your Extension")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .multilineTextAlignment(.center)
                AppInfoDetails()
        }
    }
}

struct AppInfoDetails: View {

    var body: some View {
        VStack {
            Text("1. Open Safari")
            Text("2. Highlight Ingridient List")
            Text("3. Open Extension")
            Text("4. Convert To Imperial Or Metric")
        }
        .font(.footnote)
        .foregroundColor(.black)
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
