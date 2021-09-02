//
//  ViewRouter.swift
//  ImarticusTestApp
//
//  Created by Aaryaman Saini on 01/09/21.
//

import SwiftUI

class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .clock
}

enum Page {
    case home
    case calendar
    case clock
    case profile
}
