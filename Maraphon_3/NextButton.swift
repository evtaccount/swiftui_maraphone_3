//
//  NextButton.swift
//  Maraphon_3
//
//  Created by Evgeny Evtushenko on 05/12/2023.
//

import SwiftUI

struct NextButton: View {
    let action: () -> Void
    
    private static let iconSize: CGFloat = 40
    
    private let animationTime: TimeInterval = 0.35
    private let fullSize: CGSize = CGSize(width: 1, height: 1)
    private let halfToRight: CGSize = CGSize(width: iconSize / 2, height: 0.0)
    private let halfToLeft: CGSize = CGSize(width: -iconSize / 2, height: 0.0)
    @State private var showAnimation: Bool = false
    
    var body: some View {
        Button(action: {
            action()
            showAnimation = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + animationTime) {
                showAnimation = false
            }
        }, label: {
            HStack(spacing: 0) {
                arrow
                    .opacity(showAnimation ? 1 : 0.5)
                    .scaleEffect(showAnimation ? fullSize : .zero)
                    .offset(showAnimation ? halfToRight : .zero)
                arrow
                    .offset(showAnimation ? halfToRight : halfToLeft)
                arrow
                    .opacity(showAnimation ? 0.5 : 1)
                    .scaleEffect(showAnimation ? .zero : fullSize)
                    .offset(showAnimation ? .zero : halfToLeft)
            }
            .animation(showAnimation ? .spring(.bouncy(duration: animationTime, extraBounce: 0.1)) : nil, value: showAnimation)
        })
        .frame(width: Self.iconSize * 2, height: Self.iconSize)
        .buttonStyle(CustomButtonStyle())
    }
    
    var arrow: some View {
        Image(systemName: "play.fill")
            .resizable()
            .frame(width: Self.iconSize, height: Self.iconSize)
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .frame(alignment: .center)
            .foregroundStyle(.blue)
    }
}

#Preview {
    NextButton(action: {})
}
