//
//  ImarticusTestAppApp.swift
//  ImarticusTestApp
//
//  Created by Aaryaman Saini on 01/09/21.
//

import SwiftUI

@main
struct ImarticusTestAppApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
