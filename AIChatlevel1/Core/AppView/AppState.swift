//
//  AppState.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/03/26.
//

import SwiftUI

@Observable
class AppState {
    private(set) var showTapBar: Bool {
        didSet {
            UserDefaults.standard.set(showTapBar, forKey: "showTapBarView")
        }
    }

    init(showTapBar: Bool = UserDefaults.standard.bool(forKey: "showTapBarView")) {
        self.showTapBar = showTapBar
    }

    func updateViewState(showTapBarView: Bool) {
        showTapBar = showTapBarView
    }
}
