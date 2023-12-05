//
//  ContentView.swift
//  Maraphon_3
//
//  Created by Evgeny Evtushenko on 05/12/2023.
//

import SwiftUI

struct ContentView: View {
    private static let iconSize: CGFloat = 40
    
    private let animationTime: TimeInterval = 0.3
    private let fullSize: CGSize = CGSize(width: 1, height: 1)
    private let halfToRight: CGSize = CGSize(width: iconSize / 2, height: 0.0)
    private let halfToLeft: CGSize = CGSize(width: -iconSize / 2, height: 0.0)
    @State var showAnimation: Bool = false
    
    var body: some View {
        NextButton {
            print("Tapped")
        }
    }
}

#Preview {
    ContentView()
}
