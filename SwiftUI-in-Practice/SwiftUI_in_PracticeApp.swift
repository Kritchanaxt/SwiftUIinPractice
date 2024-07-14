//
//  SwiftUI_in_PracticeApp.swift
//  SwiftUI-in-Practice
//
//  Created by Kritchanat on 14/7/2567 BE.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftUIinPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
