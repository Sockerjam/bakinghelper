//
//  BakingHelperApp.swift
//  Shared
//
//  Created by Niclas Jeppsson on 22/12/2021.
//

import SwiftUI

@main
struct BakingHelperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(cardLoader: ViewModel())
        }
    }
}
