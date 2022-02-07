//
//  HeadLineView.swift
//  BakingHelper
//
//  Created by Niclas Jeppsson on 07/02/2022.
//

import SwiftUI

struct HeadLineView: View {
    
    var body: some View {
        VStack {
                Text("The Baking Helper")
                    .font(.largeTitle)
                    .bold()
                Image(systemName: "wand.and.stars")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.red)
        }
    }
}

struct HeadLineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadLineView()
    }
}
